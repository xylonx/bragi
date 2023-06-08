import 'package:bragi/src/services/proto/bragi/bragi.pb.dart' as bragi;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:protobuf/protobuf.dart';

class PersistPlaylistNotifier
    extends StateNotifier<List<bragi.TrackCollectionDetail>> {
  PersistPlaylistNotifier() : super([]);

  // TODO(xylonx): persist by hive

  Future<void> addPlaylistByID(String id) async {
    // Hive.box("playlist").put(id, );
  }

  void addTrackToPlaylist(String playlistID, bragi.TrackInfo track) {
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

  void addPlaylist(bragi.TrackCollectionDetail playlist) {
    state = [playlist, ...state];
  }

  void removePlaylist(String id) {
    state = [
      for (final playlist in state)
        if (playlist.id != id) playlist
    ];
  }
}

final persistedPlaylistProvider = StateNotifierProvider<PersistPlaylistNotifier,
    List<bragi.TrackCollectionDetail>>(
  (ref) => PersistPlaylistNotifier(),
);

class PersistArtistNotifier extends StateNotifier<List<bragi.UserDetail>> {
  PersistArtistNotifier()
      : super([
          bragi.UserDetail(
            info: bragi.UserInfo(
              id: "11",
              provider: bragi.Provider.PROVIDER_BILIBILI,
              name: "Akie",
            ),
            description: "akiiieeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee",
            avatar: bragi.Image(
                url:
                    "https://i1.hdslb.com/bfs/face/59c22c4472089f5019a47511c1f755de08b38f8f.jpg"),
          ),
          bragi.UserDetail(
            info: bragi.UserInfo(
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
    StateNotifierProvider<PersistArtistNotifier, List<bragi.UserDetail>>(
  (ref) => PersistArtistNotifier(),
);

class PersistedAlbumNotifier
    extends StateNotifier<List<bragi.TrackCollectionDetail>> {
  PersistedAlbumNotifier() : super([]);
}

final persistedAlbumProvider = StateNotifierProvider<PersistedAlbumNotifier,
    List<bragi.TrackCollectionDetail>>((ref) => PersistedAlbumNotifier());
