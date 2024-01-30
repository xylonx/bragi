import 'package:bragi/Components/cached_network_image_with_error.dart';
import 'package:bragi/Components/provider_icons.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:flutter/material.dart';

class SearchItemTrack extends StatelessWidget {
  final Provider provider;
  final Song track;

  final double height;

  final void Function()? onTap;
  final void Function()? onLoadMore;
  final void Function()? onDismiss;

  const SearchItemTrack({
    super.key,
    required this.provider,
    required this.track,
    required this.height,
    this.onTap,
    this.onLoadMore,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return _SearchItem(
      id: track.id,
      height: height,
      coverUrl: track.cover ?? '',
      imageBorderRadius: BorderRadius.circular(height / 6),
      provider: provider,
      title: track.name,
      subtitle: track.artists.map((e) => e.name).join(', '),
      onTap: onTap,
      onLoadMore: onLoadMore,
      onDismiss: onDismiss,
    );
  }
}

class SearchItemPlaylist extends StatelessWidget {
  final Provider provider;
  final SongCollection playlist;

  final double height;

  final void Function()? onTap;

  const SearchItemPlaylist({
    super.key,
    required this.provider,
    required this.playlist,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _SearchItem(
      id: playlist.id,
      height: height,
      coverUrl: playlist.cover ?? '',
      imageBorderRadius: BorderRadius.circular(height / 6),
      provider: provider,
      title: playlist.name,
      subtitle: playlist.artists.map((e) => e.name).join(', '),
      onTap: onTap,
    );
  }
}

class SearchItemArtist extends StatelessWidget {
  final double height;

  final Provider provider;
  final Artist artist;

  final void Function()? onTap;

  const SearchItemArtist({
    super.key,
    required this.height,
    required this.provider,
    required this.artist,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return _SearchItem(
      id: artist.id,
      height: height,
      coverUrl: artist.avatar ?? '',
      imageBorderRadius: BorderRadius.circular(50),
      enableCoverIcon: true,
      provider: provider,
      title: artist.name,
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

  final Provider provider;
  final String title;
  final String subtitle;

  final void Function()? onTap;
  final void Function()? onLoadMore;
  final void Function()? onDismiss;

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
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return
        // SafeArea(
        // child:

        SizedBox(
      height: height,
      child: Dismissible(
        key: Key(id),
        background: Container(
          color: Colors.green.shade300,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.queue_music_rounded),
              )
            ],
          ),
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            if (onDismiss != null) {
              onDismiss!();
            }
          }
          return false;
        },
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: id,
                    child: ImageWithError(
                      imageUri: coverUrl,
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
      // ),
    );
  }
}
