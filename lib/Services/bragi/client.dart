import 'dart:io';

import 'package:bragi/Services/bragi/model.dart';
import 'package:dio/dio.dart';

enum SearchType {
  all,
  song,
  album,
  playlist,
}

extension SearchTypeExtension on SearchType {
  String get value {
    switch (this) {
      case SearchType.all:
        return "all";
      case SearchType.song:
        return "song";
      case SearchType.album:
        return "album";
      case SearchType.playlist:
        return "playlist";
    }
  }
}

class BragiApiClient {
  final Dio client;

  BragiApiClient({required this.client});

  factory BragiApiClient.fromBragi(String baseUrl, String token) {
    return BragiApiClient(
      client: Dio(
        BaseOptions(
          baseUrl: baseUrl,
          sendTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),
      ),
    );
  }

  Future<List<WithProvider<String>>> suggest(String keyword) async {
    final r = await client.get('/api/v1/scrape/suggest?keyword=$keyword');
    final data = r.data as List<dynamic>;
    return data.map((i) => WithProvider<String>.fromJson(i)).toList();
  }

  Future<List<ScrapeItem>> search(
    String keyword,
    SearchType t,
  ) async {
    final response =
        await client.get('/api/v1/scrape/search?keyword=$keyword&t=${t.value}');
    final data = response.data as List<dynamic>;

    return data.map((item) => ScrapeItem.fromJson(item)).toList();
  }

  Future<SongCollection> collectionDetail(
    Provider provider,
    String id,
  ) async {
    final response = await client
        .get('/api/v1/scrape/collection?provider=${provider.value}&id=$id');
    final data = response.data as Map<String, dynamic>;
    return SongCollection.fromJson(data);
  }

  Future<List<AudioStream>> stream(
    Provider provider,
    String id,
  ) async {
    final response = await client
        .get('/api/v1/scrape/stream?provider=${provider.value}&id=$id');
    final data = response.data as List<dynamic>;
    return data.map((item) => AudioStream.fromJson(item)).toList();
  }
}

// void main() async {
//   final baseUrl = 'https://your-api-base-url.com';
//   final apiClient = BragiApiClient(baseUrl);

//   try {
//     final searchResults = await apiClient.searchItems();

//     for (var scrapeItem in searchResults) {
//       print('Provider: ${scrapeItem.provider.value}');
//       if (scrapeItem.data is ScrapeItemSong) {
//         final song = scrapeItem.data as ScrapeItemSong;
//         print('Song Name: ${song.name}');
//         // Handle other fields specific to songs
//       } else if (scrapeItem.data is Artist) {
//         final artist = scrapeItem.data as Artist;
//         print('Artist Name: ${artist.name}');
//         // Handle other fields specific to artists
//       } else if (scrapeItem.data is SongCollection) {
//         final collection = scrapeItem.data as SongCollection;
//         print('Collection Name: ${collection.name}');
//         // Handle other fields specific to collections
//       }
//       // Handle other types (e.g., Playlist) as needed
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }
