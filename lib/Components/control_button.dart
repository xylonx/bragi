import 'package:audio_service/audio_service.dart';
import 'package:bragi/Components/cached_network_image_with_error.dart';
import 'package:bragi/Components/floating_modal.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:bragi/Services/notifiers/play_button_notifier.dart';
import 'package:bragi/Services/notifiers/repeat_button_notifier.dart';
import 'package:bragi/Services/player_manager.dart';
import 'package:bragi/Utils/media_converter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// PlayerPlayButton - incl play / pause / loading status
class PlayerPlayButton extends StatelessWidget {
  final double width;

  const PlayerPlayButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: playerManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: width,
              height: width,
              child: const CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: const Icon(Icons.play_arrow_rounded),
              iconSize: width,
              onPressed: playerManager.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: const Icon(Icons.pause_rounded),
              iconSize: width,
              onPressed: playerManager.pause,
            );
        }
      },
    );
  }
}

class PlayerPreviousButton extends StatelessWidget {
  final double width;

  const PlayerPreviousButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: playerManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: const Icon(Icons.skip_previous_rounded),
          iconSize: width,
          onPressed: isFirst ? null : playerManager.next,
        );
      },
    );
  }
}

class PlayerNextSongButton extends StatelessWidget {
  final double width;

  const PlayerNextSongButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: playerManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: const Icon(Icons.skip_next_rounded),
          iconSize: width,
          onPressed: isLast ? null : playerManager.next,
        );
      },
    );
  }
}

class PlayerRepeatButton extends StatelessWidget {
  final double width;

  const PlayerRepeatButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: playerManager.repeatButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case RepeatState.off:
            return IconButton(
              onPressed: playerManager.repeat,
              icon: Icon(
                Icons.repeat_rounded,
                color: Theme.of(context).disabledColor,
              ),
              iconSize: width,
            );
          case RepeatState.repeatPlaylist:
            return IconButton(
              onPressed: playerManager.repeat,
              icon: const Icon(Icons.repeat_rounded),
              iconSize: width,
            );
          case RepeatState.repeatSong:
            return IconButton(
              onPressed: playerManager.repeat,
              icon: const Icon(Icons.repeat_one_rounded),
              iconSize: width,
            );
        }
      },
    );
  }
}

class PlayerShuffleButton extends StatelessWidget {
  final double width;

  const PlayerShuffleButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: playerManager.isShuffleModeEnabledNotifier,
      builder: (_, isShuffle, __) => IconButton(
        icon: Icon(
          Icons.shuffle_rounded,
          color: isShuffle ? null : Theme.of(context).disabledColor,
        ),
        iconSize: width,
        onPressed: playerManager.shuffle,
      ),
    );
  }
}

class PlayerChangeSourceButton extends StatelessWidget {
  const PlayerChangeSourceButton({super.key});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder<MediaItem?>(
      valueListenable: playerManager.currentMediaItemNotifier,
      builder: (_, mediaItem, __) => IconButton(
          icon: const Icon(Icons.track_changes_rounded),
          onPressed: () {
            if (mediaItem != null) {
              showFloatingModalBottomSheet(
                context: context,
                builder: (context) => ChangeSourceModal(
                  playerStateManager: playerManager,
                  mediaItem: mediaItem,
                ),
              );
            }
          }),
    );
  }
}

class ChangeSourceModal extends StatefulWidget {
  final PlayerStateManager playerStateManager;
  final MediaItem mediaItem;

  const ChangeSourceModal({
    super.key,
    required this.playerStateManager,
    required this.mediaItem,
  });

  @override
  State<ChangeSourceModal> createState() => _ChangeSourceModalState();
}

class _ChangeSourceModalState extends State<ChangeSourceModal> {
  late int selectedIndex;
  late List<AudioStream> streams;

  @override
  void initState() {
    super.initState();
    final url = MediaConverter.extractUriFromMediaItem(widget.mediaItem);
    streams = MediaConverter.extractStreamsFromMediaItem(widget.mediaItem);
    selectedIndex = streams.indexWhere((element) => element.url == url);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            streams.length,
            (index) => ListTile(
              title: Text(
                widget.mediaItem.title,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(streams[index].quality),
              selected: selectedIndex == index,
              selectedColor: Theme.of(context).colorScheme.secondary,
              leading: ImageWithError(
                imageUri: widget.mediaItem.artUri.toString(),
              ),
              trailing: selectedIndex == index
                  ? const Icon(FontAwesomeIcons.towerBroadcast)
                  : null,
              onTap: () async {
                setState(() {
                  selectedIndex = index;
                });

                Navigator.of(context).pop();

                await widget.playerStateManager.updateMediaSource(
                  MediaConverter.changeMediaSource(
                    widget.mediaItem,
                    streams[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerPlaylistButton extends StatelessWidget {
  final double width;

  const PlayerPlaylistButton({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder(
      valueListenable: playerManager.playlistNotifier,
      builder: (_, playlist, __) => IconButton(
        icon: const Icon(Icons.queue_music_rounded),
        onPressed: () => showBarModalBottomSheet(
          expand: false,
          context: context,
          builder: (context) => PlayerPlaylistModal(
            playerStateManager: playerManager,
            playlist: playlist,
          ),
        ),
      ),
    );
  }
}

class PlayerPlaylistModal extends StatelessWidget {
  final PlayerStateManager playerStateManager;
  final List<MediaItem> playlist;

  const PlayerPlaylistModal({
    super.key,
    required this.playerStateManager,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: playerStateManager.playlistCurrentIndexNotifier,
          builder: (_, currentIndex, __) => ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                playlist[index].displayTitle ?? "Title",
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                playlist[index].displaySubtitle ?? "Subtitle",
                overflow: TextOverflow.ellipsis,
              ),
              selected: index == currentIndex,
              selectedColor: Theme.of(context).colorScheme.secondary,
              trailing: index == currentIndex
                  ? const Icon(FontAwesomeIcons.towerBroadcast)
                  : null,
              onTap: () {
                playerStateManager.skipToQueueItem(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
