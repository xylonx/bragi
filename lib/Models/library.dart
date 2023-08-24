import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart';
import 'package:hive/hive.dart';

// ignore: avoid_classes_with_only_static_members
class HiveLibrary {
  static const playlistBox = 'playlists';

  static Box<PlaylistDetail> get hivebox =>
      Hive.box<PlaylistDetail>(playlistBox);

  static void addPlaylist(PlaylistDetail playlistDetail) =>
      hivebox.add(playlistDetail);

  static List<PlaylistDetail> getAllPlaylists() => hivebox.values.toList();
}
