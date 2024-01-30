import 'package:audio_service/audio_service.dart';
import 'package:bragi/Services/notifiers/play_button_notifier.dart';
import 'package:bragi/Services/notifiers/progress_notifier.dart';
import 'package:bragi/Services/notifiers/repeat_button_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class PlayerStateManager {
  // Listeners: Updates going to the UI
  final currentMediaItemNotifier = ValueNotifier<MediaItem?>(null);

  final playlistNotifier = ValueNotifier<List<MediaItem>>([]);
  final playlistCurrentIndexNotifier = ValueNotifier<int?>(null);

  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  final AudioHandler _audioHandler = GetIt.I<AudioHandler>();

  // Events: Calls coming from the UI
  Future<void> init() async {
    // TODO(xylonx): recover played from hive
    _audioHandler.addQueueItems([]);

    _listenToChangesInPlaylist();

    _listenToPlaybackState();

    _listenToCurrentPosition();
    _listenToBufferedPosition();
    _listenToTotalDuration();

    _listenToChangesInSong();
  }

  void play() => _audioHandler.play();

  void pause() => _audioHandler.pause();

  void seek(Duration position) => _audioHandler.seek(position);

  void previous() => _audioHandler.skipToPrevious();

  void next() => _audioHandler.skipToNext();

  void skipToQueueItem(int index) => _audioHandler.skipToQueueItem(index);

  void repeat() {
    repeatButtonNotifier.nextState();
    final repeatMode = repeatButtonNotifier.value;
    switch (repeatMode) {
      case RepeatState.off:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.none);
        break;
      case RepeatState.repeatSong:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioHandler.setRepeatMode(AudioServiceRepeatMode.all);
        break;
    }
  }

  void shuffle() {
    final enable = !isShuffleModeEnabledNotifier.value;
    isShuffleModeEnabledNotifier.value = enable;
    if (enable) {
      _audioHandler.setShuffleMode(AudioServiceShuffleMode.all);
    } else {
      _audioHandler.setShuffleMode(AudioServiceShuffleMode.none);
    }
  }

  Future<void> add(MediaItem mediaItem) async {
    Logger.root.info('player manager add media item: $mediaItem');
    await _audioHandler.addQueueItem(mediaItem);
  }

  Future<void> addAll(List<MediaItem> mediaItems) async {
    Logger.root.info('player manager add media item: $mediaItems');
    await _audioHandler.addQueueItems(mediaItems);
  }

  Future<void> replaceWith(MediaItem mediaItem) async {
    while (_audioHandler.queue.value.isNotEmpty) {
      await remove();
    }
    await add(mediaItem);
    await _audioHandler.play();
  }

  Future<void> replaceAllWith(List<MediaItem> mediaItems) async {
    while (_audioHandler.queue.value.isNotEmpty) {
      await remove();
    }
    await addAll(mediaItems);
    await _audioHandler.play();
  }

  Future<void> insertNext(MediaItem mediaItem) async {
    final idx = playlistCurrentIndexNotifier.value;
    if (idx != null) await _insert(idx + 1, mediaItem);
  }

  Future<void> _insert(int index, MediaItem mediaItem) async {
    Logger.root
        .info('player manager add media item to index $index: $mediaItem');
    await _audioHandler.insertQueueItem(index, mediaItem);
  }

  Future<void> remove() async {
    final lastIndex = _audioHandler.queue.value.length - 1;
    if (lastIndex < 0) return;
    await _audioHandler.removeQueueItemAt(lastIndex);
  }

  Future<void> removeAt(int index) async {
    final lastIndex = _audioHandler.queue.value.length - 1;
    if (lastIndex < 0 || index > lastIndex) return;
    await _audioHandler.removeQueueItemAt(index);
  }

  void dispose() {
    _audioHandler.customAction('dispose');
  }

  void stop() {
    _audioHandler.stop();
  }

  Future<void> updateMediaSource(MediaItem mediaItem) async {
    final idx = playlistCurrentIndexNotifier.value;

    if (idx != null) {
      _audioHandler.queue.value[idx] = mediaItem;
      _audioHandler.skipToQueueItem(idx);
      // await insertNext(mediaItem);
      // await _audioHandler.skipToNext();
      // await removeAt(idx);
    }
  }

  void _listenToChangesInPlaylist() {
    _audioHandler.queue.listen((playlist) {
      if (playlist.isEmpty) {
        playlistNotifier.value = [];
        // currentSongTitleNotifier.value = '';
        currentMediaItemNotifier.value = null;
      } else {
        // final newList = playlist.map((item) => item.title).toList();
        playlistNotifier.value = playlist;
      }
      _updateSkipButtons();
    });
  }

  void _listenToPlaybackState() {
    _audioHandler.playbackState.listen((playbackState) {
      final isPlaying = playbackState.playing;
      final processingState = playbackState.processingState;
      if (processingState == AudioProcessingState.loading ||
          processingState == AudioProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != AudioProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioHandler.seek(Duration.zero);
        _audioHandler.pause();
      }

      playlistCurrentIndexNotifier.value = playbackState.queueIndex;
    });
  }

  void _listenToCurrentPosition() {
    AudioService.position.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenToBufferedPosition() {
    _audioHandler.playbackState.listen((playbackState) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: playbackState.bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenToTotalDuration() {
    _audioHandler.mediaItem.listen((mediaItem) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: mediaItem?.duration ?? Duration.zero,
      );
    });
  }

  void _listenToChangesInSong() {
    _audioHandler.mediaItem.listen((mediaItem) {
      currentMediaItemNotifier.value = mediaItem;
      _updateSkipButtons();
    });
  }

  void _updateSkipButtons() {
    final mediaItem = _audioHandler.mediaItem.value;
    final playlist = _audioHandler.queue.value;
    if (playlist.length < 2 || mediaItem == null) {
      isFirstSongNotifier.value = true;
      isLastSongNotifier.value = true;
    } else {
      isFirstSongNotifier.value = playlist.first == mediaItem;
      isLastSongNotifier.value = playlist.last == mediaItem;
    }
  }
}
