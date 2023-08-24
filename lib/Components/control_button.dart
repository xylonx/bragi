import 'package:bragi/Services/notifiers/play_button_notifier.dart';
import 'package:bragi/Services/notifiers/repeat_button_notifier.dart';
import 'package:bragi/Services/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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
