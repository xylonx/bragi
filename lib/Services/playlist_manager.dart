import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Services/player_manager.dart';
import 'package:get_it/get_it.dart';

import '../Utils/media_converter.dart';
import 'bragi/client.dart';
import 'bragi/model.dart';

Future<void> replaceWithSong(Provider provider, Song song) async {
  final client = GetIt.I<BragiApiClient>();
  final streams = await client.stream(provider, song.id);

  final playerManager = GetIt.I<PlayerStateManager>();
  await playerManager
      .replaceWith(MediaConverter.track2MediaItem(song, streams));
}

Future<void> replaceAllWithSongs(List<ProvidedSong> songs) async {
  final client = GetIt.I<BragiApiClient>();

  final mediaItems = await Future.wait(songs.map((song) async {
    final streams = await client.stream(song.provider, song.song.id);
    return MediaConverter.track2MediaItem(song.song, streams);
  }));

  final playerManager = GetIt.I<PlayerStateManager>();
  playerManager.replaceAllWith(mediaItems);
}

Future<void> addToQueue(Provider provider, Song song) async {
  final client = GetIt.I<BragiApiClient>();
  final streams = await client.stream(provider, song.id);

  final playerManager = GetIt.I<PlayerStateManager>();
  await playerManager.insertNext(MediaConverter.track2MediaItem(song, streams));
}
