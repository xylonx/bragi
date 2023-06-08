import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LibraryPlaylist {
  final TrackCollectionDetail playlist;
  final int seqID;

  LibraryPlaylist({required this.playlist, required this.seqID});
}

// class HiveLibraryPlaylist {
//   static const String boxName = "library_playlist";

//   static Box<TrackCollectionDetail> box =
//       Hive.box<TrackCollectionDetail>(boxName);

//   static TrackCollectionDetail? getByID(String id) => box.get(id);

//   static List<TrackCollectionDetail> getAll() =>
//       box.keys.map((e) => box.get(e)!).toList();
// }

class LibraryPlaylistRepository {
  static const String boxName = "library";

  static TrackCollectionDetail? getDetailByID(String id) {
    var box = Hive.box<LibraryPlaylist>(boxName);
    return box.get(id)?.playlist;
  }

  static Future<void> addPlaylist(LibraryPlaylist playlist) {
    var box = Hive.box<LibraryPlaylist>(boxName);
    return box.put(playlist.playlist.id, playlist);
  }
}
