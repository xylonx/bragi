

// class LibraryPlaylistNotifier
//     extends StateNotifier<List<bragi.TrackCollectionDetail>> {
//   LibraryPlaylistNotifier() : super([]) {}
// }
// 
// final libraryPlaylistProvider = StateNotifierProvider<LibraryPlaylistNotifier,
//     Map<String, bragi.TrackCollectionDetail>>(
//   (ref) => LibraryPlaylistNotifier(),
// );
// 
// // class Library extends PersistedChangeNotifier {
// //   List<UserDetail> artists;
// //   List<TrackCollectionDetail> playlists;
// //   List<TrackCollectionDetail> albums;
// // 
// //   Library({
// //     required this.artists,
// //     required this.playlists,
// //     required this.albums,
// //   }) : super();
// // 
// //   void likeArtist(UserDetail artist) {
// //     // not found so insert it
// //     if (artists.indexWhere((e) => e.info.id == artist.info.id) == -1) {
// //       artists.insert(0, artist);
// //       notifyListeners();
// //       updatePersistence();
// //     }
// //   }
// // 
// //   void dislikeArtist(String id) {
// //     artists.removeWhere((element) => element.info.id == id);
// //     notifyListeners();
// //     updatePersistence();
// //   }
// // 
// //   @override
// //   FutureOr<void> loadFromLocal(Map<String, dynamic> map) {
// //   map["artists"];
// //   }
// // 
// //   @override
// //   FutureOr<Map<String, dynamic>> toMap() {
// //     return {
// //       "artists": artists,
// //       "playlists": playlists,
// //       "albums": albums,
// //     };
// //   }
// // }
// // 