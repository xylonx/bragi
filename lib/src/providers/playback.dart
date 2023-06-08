import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:bragi/src/providers/audio_player.dart';
import 'package:bragi/src/services/mobile_audio_service.dart';
import 'package:bragi/src/utils/logger.dart';
import 'package:bragi/src/utils/platform.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PlaybackStatus {
  playing,
  loading,
  idle,
}

enum AudioQuality {
  high,
  low,
}

class Playback extends ChangeNotifier {
  // player properties
  bool isShuffled;
  bool isLoop;
  bool isPlaying;
  Duration currentDuration;
  double volume;

  // class dependencies
  // LinuxAudioService? _linuxAudioService;
  MobileAudioService? mobileAudioService;

  // foreign/passed properties
  AudioPlayer player;
  Ref ref;

  // internal stuff
  final List<StreamSubscription> _subscriptions;
  final _logger = getLogger(Playback);

  PlaybackStatus status;

  Playback({required this.player, required this.ref, this.mobileAudioService})
      : isShuffled = false,
        isLoop = false,
        isPlaying = false,
        currentDuration = Duration.zero,
        volume = 1,
        _subscriptions = [],
        status = PlaybackStatus.idle,
        super() {
    (() async {
      if (kIsAndroid) {
        await player.setVolume(1);
        volume = 1;
      } else {
        await player.setVolume(volume);
      }

      _subscriptions.addAll([
        player.onPlayerStateChanged.listen((event) async {
          isPlaying = status == PlayerState.playing;
          notifyListeners();
        })
      ]);
    })();
  }
}

final playbackProvider = ChangeNotifierProvider<Playback>((ref) {
  final player = ref.watch(audioPlayerProvider);
  return Playback(player: player, ref: ref);
});
