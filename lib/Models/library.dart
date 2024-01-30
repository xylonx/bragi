import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

// ignore: avoid_classes_with_only_static_members
class HiveLibrary {
  static const playlistBox = 'playlists_v2';

  static Box<ProvidedPlaylist> get hivebox =>
      Hive.box<ProvidedPlaylist>(playlistBox);

  static void newPlaylist(String name, String? cover, String? desc) async {
    final uuid = Uuid();
    final id = "Local::${uuid.v4()}";
    await hivebox.put(
        id,
        ProvidedPlaylist(
          id: id,
          isLocal: true,
          name: name,
          cover: cover,
          description: desc,
          artists: [],
          songs: [],
        ));
  }

  // search every time
  static Future<void> addPlaylist(
      Provider provider, ProvidedPlaylist playlist) async {
    await hivebox.put(
      "${provider.value}::${playlist.id}",
      playlist,
    );
  }

  static String primaryKey(Provider? provider, String id) {
    if (provider != null && provider != Provider.local) {
      return "${provider.value}::$id";
    }
    return "Local::$id";
  }

  static void deletePlaylist(Provider? provider, String id) {
    hivebox.delete(HiveLibrary.primaryKey(provider, id));
  }

  static bool isPlaylistExists(Provider? provider, String id) {
    return hivebox.containsKey(HiveLibrary.primaryKey(provider, id));
  }

  static Future<void> forkPlaylist(ProvidedPlaylist playlist) async {
    await hivebox.put("Local::${playlist.id}", playlist);
  }

  static void addTrackToPlaylist(
    String playlistId,
    Provider provider,
    Song song,
  ) async {
    final detail = hivebox.get(playlistId);
    if (detail != null && detail.isLocal) {
      detail.songs.insert(0, ProvidedSong.fromSong(provider, song));
      await hivebox.put(playlistId, detail);
    }
  }

  static bool isLocalPlaylist(String id) {
    return id.startsWith("Local::");
  }

  static ProvidedPlaylist? getPlaylistByID(String id) {
    return hivebox.get(id);
  }

  static Future<void> removePlaylistByID(String id) async {
    await hivebox.delete(id);
  }

  static Future<void> removeAll() async {
    await hivebox.clear();
  }

  static List<ProvidedPlaylist> getAllPlaylists() => hivebox.values.toList();

  static List<ProvidedPlaylist> getAllLocalPlaylists() {
    return hivebox.values
        .where((element) => HiveLibrary.isLocalPlaylist(element.id))
        .toList();
  }
}
