import 'package:bragi/Components/provider_icons.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart' as bragi;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchItemTrack extends StatelessWidget {
  final bragi.Track track;

  final double height;

  final void Function()? onTap;
  final void Function()? onLoadMore;

  const SearchItemTrack({
    super.key,
    required this.height,
    required this.track,
    this.onTap,
    this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return _SearchItem(
      id: track.id,
      height: height,
      coverUrl: track.cover.url,
      imageBorderRadius: BorderRadius.circular(height / 6),
      provider: track.provider,
      title: track.name,
      subtitle: track.artists.map((e) => e.name).join(', '),
      onTap: onTap,
      onLoadMore: onLoadMore,
    );
  }
}

class SearchItemPlaylist extends StatelessWidget {
  final bragi.Playlist playlist;

  final double height;

  final void Function()? onTap;

  const SearchItemPlaylist({
    super.key,
    required this.playlist,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _SearchItem(
      id: playlist.id,
      height: height,
      coverUrl: playlist.cover.url,
      imageBorderRadius: BorderRadius.circular(height / 6),
      provider: playlist.provider,
      title: playlist.name,
      subtitle: playlist.artists.map((e) => e.name).join(', '),
      onTap: onTap,
    );
  }
}

class SearchItemArtist extends StatelessWidget {
  final double height;

  final bragi.ArtistDetail artist;

  final void Function()? onTap;

  const SearchItemArtist({
    super.key,
    required this.height,
    required this.artist,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _SearchItem(
      id: artist.artist.id,
      height: height,
      coverUrl: artist.avatar.url,
      imageBorderRadius: BorderRadius.circular(50),
      enableCoverIcon: true,
      provider: artist.artist.provider,
      title: artist.artist.name,
      subtitle: '',
      // subtitle: artist.description,
      onTap: onTap,
    );
  }
}

class _SearchItem extends StatelessWidget {
  final double height;

  final String id;
  final String coverUrl;
  final BorderRadius imageBorderRadius;
  final bool enableCoverIcon;

  final bragi.Provider provider;
  final String title;
  final String subtitle;

  final void Function()? onTap;
  final void Function()? onLoadMore;

  const _SearchItem({
    required this.id,
    required this.height,
    required this.coverUrl,
    required this.imageBorderRadius,
    this.enableCoverIcon = false,
    required this.provider,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.onLoadMore,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: height,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: id,
                    child: CachedNetworkImage(
                      imageUrl: coverUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        width: height,
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: imageBorderRadius,
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/cover.jpg'),
                      ),
                      placeholder: (context, url) => const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/cover.jpg'),
                      ),
                    ),
                  ),
                  if (enableCoverIcon)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child:
                          Icon(ProviderIcons.icons(provider), size: height / 4),
                    ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: height / 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            if (!enableCoverIcon)
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: Container(
                                  padding: EdgeInsets.only(right: height / 10),
                                  child: Icon(
                                    ProviderIcons.icons(provider),
                                    size: height / 4,
                                  ),
                                ),
                              ),
                            TextSpan(
                              text: title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (subtitle.isNotEmpty) SizedBox(height: height / 5),
                      if (subtitle.isNotEmpty)
                        Text(subtitle, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
              ),
              if (onLoadMore != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: height / 12),
                  child: IconButton(
                    icon: const Icon(Icons.more_vert_rounded),
                    onPressed: onLoadMore,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
