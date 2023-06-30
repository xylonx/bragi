import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler
    with
        QueueHandler, // mix in default queue callback implementations
        SeekHandler {
  // mix in default seek callback implementations

  final player = AudioPlayer();

  MyAudioHandler() {
    // loadEmptyPlaylist();
    // player.setAsset("spotify:track:0Hd2cCOTglr0qGwgfo1HR5.ogg");
    player.setUrl(
        "http://localhost:4433/spotify:track:0Hd2cCOTglr0qGwgfo1HR5.wav");
    // player.setUrl(
    // "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav");
  }

  // Future<void> loadEmptyPlaylist() async {
  //   try {
  //     await player.setAudioSource(playlist);
  //   } catch (e) {
  //     print("error: $e");
  //   }
  // }

  // The most common callbacks:
  @override
  Future<void> play() async {
    // playbackState.add(
    //   playbackState.value.copyWith(
    //     playing: true,
    //     controls: [MediaControl.pause],
    //   ),
    // );
    await player.play();
  }

  @override
  Future<void> pause() async {
    // playbackState.add(
    //   playbackState.value.copyWith(
    //     playing: false,
    //     controls: [MediaControl.play],
    //   ),
    // );
    await player.pause();
  }

  @override
  Future<void> stop() async {
    await player.stop();
  }

  @override
  Future<void> seek(Duration position) async {}

  @override
  Future<void> skipToQueueItem(int index) async {}
}
