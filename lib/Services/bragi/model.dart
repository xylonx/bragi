enum Provider {
  bilibili,
  netEase,
  spotify,
  youtube,

  local, // only used in local
}

extension ProviderExtension on Provider {
  String get value {
    switch (this) {
      case Provider.bilibili:
        return 'bilibili';
      case Provider.netEase:
        return 'netease';
      case Provider.spotify:
        return 'spotify';
      case Provider.youtube:
        return 'youtube';
      case Provider.local:
        return "local";
    }
  }

  static Provider fromValue(String value) {
    switch (value.toLowerCase()) {
      case 'bilibili':
        return Provider.bilibili;
      case 'netease':
        return Provider.netEase;
      case 'spotify':
        return Provider.spotify;
      case 'youtube':
        return Provider.youtube;
      default:
        throw ArgumentError('Invalid Provider value: $value');
    }
  }
}

class WithProvider<T> {
  Provider provider;
  T data;

  WithProvider({required this.provider, required this.data});

  factory WithProvider.fromJson(Map<String, dynamic> json) {
    final providerString = json['provider'].toLowerCase();
    final provider = Provider.values.firstWhere(
      (value) => value.toString().split('.').last == providerString,
      orElse: () => Provider.youtube, // Default value or handle as needed
    );

    return WithProvider(
      provider: provider,
      data: json['data'],
    );
  }
}

class ScrapeItem {
  Provider provider;
  ScrapeData data;

  ScrapeItem({
    required this.provider,
    required this.data,
  });

  factory ScrapeItem.fromJson(Map<String, dynamic> json) {
    // final providerString = json['provider'].toLowerCase();
    // final provider = Provider.values.firstWhere(
    //   (value) => value.toString().split('.').last == providerString,
    //   orElse: () => Provider.youtube, // Default value or handle as needed
    // );
    final provider = ProviderExtension.fromValue(json['provider']);

    final data = ScrapeData.fromJson(json['data']);

    return ScrapeItem(provider: provider, data: data);
  }
}

abstract class ScrapeData {
  factory ScrapeData.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('song')) {
      return Song.fromJson(json['song']);
    } else if (json.containsKey('artist')) {
      return Artist.fromJson(json['artist']);
    } else if (json.containsKey('album')) {
      return SongCollection.fromJson(json['album']);
    } else if (json.containsKey('playlist')) {
      return SongCollection.fromJson(json['playlist']);
    } else {
      throw ArgumentError('Invalid ScrapeData type in JSON');
    }
  }
}

class Song implements ScrapeData {
  String id;
  String name;
  List<Artist> artists;
  String? cover;
  int? duration;

  Song({
    required this.id,
    required this.name,
    required this.artists,
    this.cover,
    this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'],
      name: json['name'],
      artists: List<Artist>.from(
          json['artists'].map((artist) => Artist.fromJson(artist))),
      cover: json['cover'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'artists': artists.map((artist) => artist.toJson()).toList(),
      'cover': cover,
      'duration': duration,
    };
  }
}

class Artist implements ScrapeData {
  String id;
  String name;
  String? description;
  String? avatar;

  Artist({
    required this.id,
    required this.name,
    this.description,
    this.avatar,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'avatar': avatar,
    };
  }
}

class SongCollection implements ScrapeData {
  String id;
  String name;
  List<Artist> artists;
  String? cover;
  String? description;
  List<Song> songs;

  SongCollection({
    required this.id,
    required this.name,
    required this.artists,
    this.cover,
    this.description,
    required this.songs,
  });

  factory SongCollection.fromJson(Map<String, dynamic> json) {
    return SongCollection(
      id: json['id'],
      name: json['name'],
      artists: List<Artist>.from(
          json['artists'].map((artist) => Artist.fromJson(artist))),
      cover: json['cover'],
      description: json['description'],
      songs: List<Song>.from(json['songs'].map((song) => Song.fromJson(song))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'artists': artists.map((artist) => artist.toJson()).toList(),
      'cover': cover,
      'description': description,
      'songs': songs.map((song) => song.toJson()).toList(),
    };
  }
}

class AudioStream {
  String quality;
  String url;

  AudioStream({
    required this.quality,
    required this.url,
  });

  factory AudioStream.fromJson(Map<String, dynamic> json) {
    return AudioStream(
      quality: json['quality'],
      url: json['url'],
    );
  }
}
