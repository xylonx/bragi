import 'package:bragi/src/providers/liked.dart';
import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';
import 'package:bragi/src/widgets/avatar/provider_avatar.dart';
import 'package:bragi/src/widgets/image/provider_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryPage extends ConsumerStatefulWidget {
  const LibraryPage({super.key});

  static const icon = Icon(Icons.library_music_rounded);

  @override
  ConsumerState<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends ConsumerState<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    List<UserDetail> artists = ref.watch(persistedArtistProvider);
    List<TrackCollectionDetail> playlists =
        ref.watch(persistedPlaylistProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Liked Artist",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  itemCount: artists.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProviderAvatar(
                    radius: 100,
                    url: artists[index].avatar.url,
                    provider: artists[index].info.provider,
                    text: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        artists[index].info.name,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 22),
                ),
              ),
              Text(
                "Liked Album",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  itemCount: playlists.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProviderCachedImage(
                    width: 100,
                    length: 100,
                    url: artists[index].avatar.url,
                    provider: artists[index].info.provider,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 22),
                ),
              ),
              Text(
                "Liked Playlist",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  itemCount: playlists.length,
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProviderCachedImage(
                    width: 100,
                    length: 100,
                    url: artists[index].avatar.url,
                    provider: artists[index].info.provider,
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 22),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
