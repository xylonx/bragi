import 'package:bragi/src/providers/bragi.dart';
import 'package:bragi/src/screens/detail/param.dart';
import 'package:bragi/src/services/proto/bragi/bragi.pb.dart' as bragi;
import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:bragi/src/widgets/avatar/provider_avatar.dart';
import 'package:bragi/src/widgets/image/provider_image.dart';
import 'package:bragi/src/widgets/info/track.dart';
import 'package:bragi/src/widgets/text/provider_text.dart';
import 'package:flutter/gestures.dart';
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
  Future<bragi.TrackCollectionDetail?> fetchTrackCollection(
      bragi.Provider provider, String id) async {
    BragiClient? client = ref.watch(bragiClientProvider);
    bragi.DetailReplay? reply = await client?.detail(bragi.DetailRequest(
      provider: provider,
      id: id,
      zone: bragi.SearchZone.SEARCH_ZONE_PLAYLIST,
    ));
    switch (reply?.whichItem()) {
      case DetailReplay_Item.playlist:
        return reply?.ensurePlaylist();
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final params =
        ModalRoute.of(context)!.settings.arguments as PlaylistDetailParameter;

    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(children: [
            WidgetSpan(child: ProviderIcon(provider: params.provider)),
            const TextSpan(text: "Playlist"),
          ]),
        ),
      ),
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
            TrackCollectionDetail playlist = snapshot.data!;
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      playlist.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: playlist.tracks.length + 1,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? Header(
                              coverUrl: playlist.cover.url,
                              artists: playlist.authors,
                              width: 200,
                              length: 200,
                            )
                          : TrackInfoItem(info: playlist.tracks[index - 1]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
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
    required this.length,
    required this.width,
    required this.artists,
  });

  final String coverUrl;
  final double length;
  final double width;
  final List<UserDetail> artists;

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
          padding: const EdgeInsets.all(8.0),
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
                                provider: e.info.provider,
                                url: e.avatar.url,
                                radius: 20,
                              ),
                            ),
                          ),
                          TextSpan(
                            text: e.info.name,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.of(context).pushNamed(
                                  "/detail/artist",
                                  arguments: ArtistDetailParameter(
                                    id: e.info.id,
                                    provider: e.info.provider,
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    )
                    .toList()),
          ),
        ),
      ],
    );
  }
}
