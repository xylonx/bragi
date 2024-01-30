import 'package:bragi/Services/bragi/model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProvidedSong {
  Provider provider;
  Song song;

  ProvidedSong({
    required this.provider,
    required this.song,
  });

  factory ProvidedSong.fromSong(Provider provider, Song song) {
    return ProvidedSong(provider: provider, song: song);
  }

  factory ProvidedSong.fromJson(Map<String, dynamic> json) {
    final provider = ProviderExtension.fromValue(json["provider"]);
    final song = Song.fromJson(json["data"]);

    return ProvidedSong(provider: provider, song: song);
  }

  Map<String, dynamic> toJson() {
    return {
      "provider": provider.value,
      "data": song.toJson(),
    };
  }
}

class ProvidedPlaylist {
  String id;

  bool isLocal;
  Provider? provider; // if isLocal, then no provider

  String name;
  List<Artist> artists;
  String? cover;
  String? description;
  List<ProvidedSong> songs;

  ProvidedPlaylist({
    required this.id,
    required this.isLocal,
    this.provider,
    required this.name,
    required this.artists,
    this.cover,
    this.description,
    required this.songs,
  });

  factory ProvidedPlaylist.fromSongCollection(
      Provider provider, SongCollection collection) {
    return ProvidedPlaylist(
      id: collection.id,
      provider: provider,
      isLocal: false,
      name: collection.name,
      artists: collection.artists,
      cover: collection.cover,
      description: collection.description,
      songs: collection.songs
          .map((e) => ProvidedSong.fromSong(provider, e))
          .toList(),
    );
  }

  SongCollection toSongCollection() {
    return SongCollection(
      id: id,
      name: name,
      artists: artists,
      cover: cover,
      description: description,
      songs: songs.map((e) => e.song).toList(),
    );
  }

  factory ProvidedPlaylist.forkSongCollection(
      Provider provider, SongCollection collection) {
    return ProvidedPlaylist(
      id: collection.id,
      isLocal: true,
      name: collection.name,
      artists: collection.artists,
      songs: collection.songs
          .map((e) => ProvidedSong.fromSong(provider, e))
          .toList(),
    );
  }

  factory ProvidedPlaylist.fromJson(Map<String, dynamic> json) {
    final data = Map<String, dynamic>.from(json['data'] ?? {});
    Provider? provider;
    if (data['isLocal'] == false) {
      provider = ProviderExtension.fromValue(json["provider"]);
    }

    return ProvidedPlaylist(
      id: data["id"],
      isLocal: data["isLocal"],
      provider: provider,
      name: data['name'],
      artists: List<Artist>.from(
          (json['artists'] ?? []).map((artist) => Artist.fromJson(artist))),
      cover: json['cover'],
      description: json['description'],
      songs: List<ProvidedSong>.from(
          (json['songs'] ?? []).map((song) => Song.fromJson(song))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "provider": provider?.value,
      "data": {
        'id': id,
        "isLocal": isLocal,
        'name': name,
        'artists': artists.map((artist) => artist.toJson()).toList(),
        'cover': cover,
        'description': description,
        'songs': songs.map((song) => song.toJson()).toList(),
      }
    };
  }
}

class ProvidedPlaylistAdapter extends TypeAdapter<ProvidedPlaylist> {
  @override
  int get typeId => 1;

  @override
  ProvidedPlaylist read(BinaryReader reader) {
    return ProvidedPlaylist.fromJson(
        Map<String, dynamic>.from(reader.readMap()));
  }

  @override
  void write(BinaryWriter writer, ProvidedPlaylist obj) {
    writer.writeMap(obj.toJson());
  }
}
