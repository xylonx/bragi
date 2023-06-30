import 'package:bragi/src/services/proto/bragi/bragi.pb.dart' as bragi;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuf/protobuf.dart';

class PersistPlaylistNotifier
    extends StateNotifier<List<bragi.PlaylistDetail>> {
  PersistPlaylistNotifier() : super([]);

  // TODO(xylonx): persist by hive

  Future<void> addPlaylistByID(String id) async {
    // Hive.box("playlist").put(id, );
  }

  void addTrackToPlaylist(String playlistID, bragi.Track track) {
    state = [
      for (final playlist in state)
        if (playlist.id != playlistID)
          playlist
        else
          playlist.rebuild((p0) {
            p0.tracks.insert(0, track);
          })
    ];
  }

  void addPlaylist(bragi.PlaylistDetail playlist) {
    state = [playlist, ...state];
  }

  void removePlaylist(String id) {
    state = [
      for (final playlist in state)
        if (playlist.id != id) playlist
    ];
  }
}

final persistedPlaylistProvider =
    StateNotifierProvider<PersistPlaylistNotifier, List<bragi.PlaylistDetail>>(
  (ref) => PersistPlaylistNotifier(),
);

class PersistArtistNotifier extends StateNotifier<List<bragi.ArtistDetail>> {
  PersistArtistNotifier()
      : super([
          bragi.ArtistDetail(
            artist: bragi.Artist(
              id: "11",
              provider: bragi.Provider.PROVIDER_BILIBILI,
              name: "Akie",
            ),
            description: "akiiieeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
            avatar: bragi.Image(
                url:
                    "https://i1.hdslb.com/bfs/face/59c22c4472089f5019a47511c1f755de08b38f8f.jpg"),
          ),
          bragi.ArtistDetail(
            artist: bragi.Artist(
              id: "11",
              provider: bragi.Provider.PROVIDER_BILIBILI,
              name: "Akie",
            ),
            description: "akiiieeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
            avatar: bragi.Image(
                url:
                    "https://i1.hdslb.com/bfs/face/59c22c4472089f5019a47511c1f755de08b38f8f.jpg"),
          )
        ]);
}

final persistedArtistProvider =
    StateNotifierProvider<PersistArtistNotifier, List<bragi.ArtistDetail>>(
  (ref) => PersistArtistNotifier(),
);

class PersistedAlbumNotifier extends StateNotifier<List<bragi.PlaylistDetail>> {
  PersistedAlbumNotifier() : super([]);
}

final persistedAlbumProvider =
    StateNotifierProvider<PersistedAlbumNotifier, List<bragi.PlaylistDetail>>(
        (ref) => PersistedAlbumNotifier());
