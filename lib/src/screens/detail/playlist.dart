import 'package:bragi/src/providers/bragi.dart';
import 'package:bragi/src/screens/detail/param.dart';
import 'package:bragi/src/services/proto/bragi/bragi.pb.dart' as bragi;
import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:bragi/src/widgets/avatar/provider_avatar.dart';
import 'package:bragi/src/widgets/image/provider_image.dart';
import 'package:bragi/src/widgets/info/track.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaylistDetailScreen extends ConsumerStatefulWidget {
  const PlaylistDetailScreen({super.key});

  static const routeName = "/detail/playlist";

  @override
  ConsumerState<PlaylistDetailScreen> createState() =>
      _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends ConsumerState<PlaylistDetailScreen> {
  Future<bragi.PlaylistDetail?> fetchTrackCollection(
      bragi.Provider provider, String id) async {
    BragiServiceClient? client = ref.watch(bragiClientProvider);
    bragi.DetailResponse? reply = await client?.detail(bragi.DetailRequest(
      provider: provider,
      id: id,
      zone: bragi.Zone.ZONE_PLAYLIST,
    ));
    switch (reply?.item.whichItem()) {
      case DetailResponse_DetailItem_Item.playlist:
        return reply?.item.ensurePlaylist();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final params =
        ModalRoute.of(context)!.settings.arguments as PlaylistDetailParameter;

    return Scaffold(
      body: FutureBuilder(
        future: fetchTrackCollection(params.provider, params.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Error ${snapshot.error}"));
            }
            if (snapshot.data == null) {
              return const Center(
                  child: Text("Error: Failed to fetch playlist data"));
            }
            PlaylistDetail playlist = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: playlist.tracks.length + 1,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Header(
                              coverUrl: playlist.cover.url,
                              name: playlist.name,
                              artists: playlist.artists,
                              width: 250,
                              length: 250,
                            )
                          : TrackInfoItem(
                              info: playlist.tracks[index - 1],
                              height: 60,
                            );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.coverUrl,
    required this.name,
    required this.length,
    required this.width,
    required this.artists,
  });

  final String coverUrl;
  final String name;
  final double length;
  final double width;
  final List<ArtistDetail> artists;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ProviderCachedImage(
            url: coverUrl,
            length: length,
            width: width,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Center(
            child: Text(
              name,
              style: Theme.of(context).textTheme.headlineSmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: RichText(
              text: TextSpan(
                  children: artists
                      .map(
                        (e) => TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: ProviderAvatar(
                                  provider: e.artist.provider,
                                  url: e.avatar.url,
                                  radius: 20,
                                ),
                              ),
                            ),
                            TextSpan(text: e.artist.name),
                          ],
                        ),
                      )
                      .toList()),
            ),
          ),
        ),
      ],
    );
  }
}
