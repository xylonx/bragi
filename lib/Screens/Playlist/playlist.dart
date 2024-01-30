import 'package:bragi/Components/cached_network_image_with_error.dart';
import 'package:bragi/Components/floating_modal.dart';
import 'package:bragi/Components/gradient_container.dart';
import 'package:bragi/Components/mini_player.dart';
import 'package:bragi/Models/library.dart';
import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Screens/Search/search_item.dart';
import 'package:bragi/Screens/Search/search_item_modal.dart';
import 'package:bragi/Services/bragi/client.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:bragi/Services/playlist_manager.dart';
import 'package:bragi/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

class PlaylistPage extends StatefulWidget {
  final Provider? provider;
  final String id;

  final bool local;

  const PlaylistPage({
    super.key,
    this.provider,
    required this.id,
    required this.local,
  });

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  bool fetched = false;
  ProvidedPlaylist? playlist;

  final ScrollController _scrollController = ScrollController();

  final ValueNotifier<bool> isTransparent = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();

    _fetchPlaylist(1);
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  Future<void> _fetchPlaylist(int page) async {
    if (widget.local) {
      setState(() {
        fetched = true;
        playlist = HiveLibrary.getPlaylistByID(widget.id);
      });
    } else {
      final client = GetIt.I<BragiApiClient>();
      final detail = await client.collectionDetail(widget.provider!, widget.id);
      setState(() {
        fetched = true;
        playlist =
            ProvidedPlaylist.fromSongCollection(widget.provider!, detail);
      });
    }
    Logger.root.info('current playlist detail: $playlist');
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: !fetched
                    ? const Center(child: CircularProgressIndicator())
                    : playlist == null
                        ? const Center(child: Text("fetch playlist failed"))
                        : BouncyPlaylistHeaderScrollView(
                            scrollController: _scrollController,
                            title: playlist!.name,
                            subtitle:
                                playlist!.artists.map((e) => e.name).join(", "),
                            imageUrl: playlist!.cover ?? "",
                            onPlayTap: () =>
                                replaceAllWithSongs(playlist!.songs),
                            actions: [
                              // only local playlist can be deleted
                              if (HiveLibrary.isPlaylistExists(
                                  widget.provider, playlist!.id))
                                IconButton(
                                  icon: const Icon(Icons.delete_rounded),
                                  onPressed: () {
                                    HiveLibrary.deletePlaylist(
                                        widget.provider, playlist!.id);
                                    Navigator.pop(context);
                                  },
                                ),

                              // only online playlist without added can be add
                              if (!widget.local &&
                                  !HiveLibrary.isPlaylistExists(
                                      widget.provider!, playlist!.id))
                                IconButton(
                                  icon: const Icon(Icons.add_circle_rounded),
                                  onPressed: () async {
                                    if (playlist != null) {
                                      HiveLibrary.addPlaylist(
                                          widget.provider!, playlist!);
                                      Snackbar.show(
                                          context, "Add playlist successfully");
                                    }
                                  },
                                ),
                              if (!widget.local)
                                IconButton(
                                  icon: const Icon(Icons.fork_right_rounded),
                                  onPressed: () async {
                                    if (playlist != null) {
                                      HiveLibrary.forkPlaylist(playlist!);
                                      Snackbar.show(context,
                                          "Fork playlist successfully");
                                    }
                                  },
                                ),
                            ],
                            sliverList: SliverList(
                              delegate: SliverChildListDelegate(
                                playlist!.songs
                                    .map(
                                      (song) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 18,
                                          vertical: 6,
                                        ),
                                        child: SearchItemTrack(
                                          height: 60,
                                          provider: song.provider,
                                          track: song.song,
                                          onTap: () => replaceWithSong(
                                              song.provider, song.song),
                                          onDismiss: () => addToQueue(
                                              song.provider, song.song),
                                          onLoadMore: () =>
                                              showFloatingModalBottomSheet(
                                            context: context,
                                            builder: (context) =>
                                                SearchItemModal(
                                                    provider: song.provider,
                                                    track: song.song),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
              ),
            ),
            MiniPlayer(),
          ],
        ),
      ),
    );
  }
}

class BouncyPlaylistHeaderScrollView extends StatelessWidget {
  final ScrollController scrollController;
  final SliverList sliverList;

  // final SongCollection playlist;
  final String title;
  final String subtitle;
  final String imageUrl;

  final List<Widget>? actions;

  final Function? onPlayTap;
  final Function? onShuffleTap;

  BouncyPlaylistHeaderScrollView({
    super.key,
    required this.scrollController,
    required this.sliverList,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.actions,
    this.onPlayTap,
    this.onShuffleTap,
  });

  final ValueNotifier<bool> isTransparent = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.width * 0.6;
    final double screenWidth = MediaQuery.of(context).size.width * 0.5;

    return CustomScrollView(
      controller: scrollController,
      shrinkWrap: false,
      physics: const BouncingScrollPhysics(),
      slivers: [
        AnimatedBuilder(
          animation: scrollController,
          child: FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: ImageWithError(
                            imageUri: imageUrl,
                          ),
                        ),
                      ),
                    ),
                    SizedBox.square(
                      dimension: screenWidth,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10.0,
                          right: 20.0,
                          top: 30.0,
                        ),
                        child: Align(
                          alignment: Alignment.lerp(
                            Alignment.topCenter,
                            Alignment.center,
                            0.5,
                          )!,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // if (playlist.artists
                              //     .map((e) => e.name)
                              //     .toList()
                              //     .join(", "))
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 3.0,
                                ),
                                child: Text(
                                  subtitle,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .color,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (onPlayTap != null)
                                    Expanded(
                                      flex: 2,
                                      child: GestureDetector(
                                        onTap: () {
                                          onPlayTap!.call();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            // color: Colors.white,
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 5.0,
                                                offset: Offset(0.0, 3.0),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: Theme.of(context)
                                                              .colorScheme
                                                              .secondary ==
                                                          Colors.white
                                                      ? Colors.black
                                                      : Colors.white,
                                                  size: 26.0,
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  // AppLocalizations.of(context)!
                                                  // .play,
                                                  "Play",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    color: Theme.of(context)
                                                                .colorScheme
                                                                .secondary ==
                                                            Colors.white
                                                        ? Colors.black
                                                        : Colors.white,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(width: 10.0),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(width: 15),
                                  if (onShuffleTap != null)
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          onShuffleTap!.call();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                            top: 10,
                                            bottom: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Icon(
                                              Icons.shuffle_rounded,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          builder: (context, child) {
            if (scrollController.offset.roundToDouble() > expandedHeight - 80) {
              isTransparent.value = false;
            } else {
              isTransparent.value = true;
            }
            return SliverAppBar(
              elevation: 0,
              stretch: true,
              pinned: true,
              centerTitle: true,
              // floating: true,
              backgroundColor: isTransparent.value ? Colors.transparent : null,
              iconTheme: Theme.of(context).iconTheme,
              expandedHeight: expandedHeight,
              actions: actions,
              flexibleSpace: child,
            );
          },
        ),
        sliverList,
      ],
    );
  }
}


// class BouncyPlaylistHeaderScrollView extends StatelessWidget {
//   final ScrollController scrollController;
//   final SliverList sliverList;
//   final bool shrinkWrap;
//   final List<Widget>? actions;
//   final String title;
//   final String? subtitle;
//   final String? secondarySubtitle;
//   final String? imageUrl;
//   final bool localImage;
//   final String placeholderImage;
//   final Function? onPlayTap;
//   final Function? onShuffleTap;

//   const BouncyPlaylistHeaderScrollView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class _PlaylistPageState extends State<PlaylistPage> {
//   final PagingController<int, Song> _pagingController =
//       PagingController(firstPageKey: 0);
// 
//   SongCollection? playlistDetail;
// 
//   @override
//   void initState() {
//     Logger.root.info(
//       'start playlist with ${widget.id} ${widget.provider} ${widget.local}',
//     );
// 
//     _pagingController.refresh();
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPlaylist(pageKey);
//     });
//     super.initState();
//   }
// 
//   @override
//   void dispose() {
//     _pagingController.dispose();
//     super.dispose();
//   }
// 
//   Future<void> _fetchPlaylist(int page) async {
//     SongCollection? playlist;
//     if (widget.local) {
//       playlist = HiveLibrary.getPlaylistByID(widget.id);
//     } else {
//       final client = GetIt.I<BragiApiClient>();
//       playlist = await client.collectionDetail(widget.provider, widget.id);
//     }
//     Logger.root.info('current playlist detail: $playlist');
// 
//     setState(() {
//       playlistDetail = playlist;
//     });
// 
//     _pagingController.appendLastPage(playlist?.songs ?? []);
//   }
// 
//   Future<void> playCurrentPlaylist() async {
//     final client = GetIt.I<BragiApiClient>();
// 
//     final mediaItems =
//         await Future.wait(playlistDetail!.songs.map((song) async {
//       final streams = await client.stream(widget.provider, song.id);
//       return MediaConverter.track2MediaItem(song, streams);
//     }));
// 
//     final playerManger = GetIt.I<PlayerStateManager>();
// 
//     playerManger.replaceAllWith(mediaItems);
//   }
// 
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       direction: DismissDirection.down,
//       background: const ColoredBox(color: Colors.transparent),
//       key: const Key('PlaylistPage'),
//       onDismissed: (direction) => Navigator.pop(context),
//       child: SafeArea(
//         child: Scaffold(
//           resizeToAvoidBottomInset: true,
//           backgroundColor: Colors.transparent,
//           body: Column(
//             children: [
//               Expanded(
//                 child: CustomScrollView(
//                   slivers: [
//                     PlaylistSliverHeader(
//                       height: 200,
//                       playlistDetail: playlistDetail,
//                       local: widget.local,
//                     ),
//                     SliverToBoxAdapter(
//                       child: IconButton(
//                         icon: const Icon(Icons.play_arrow_rounded),
//                         onPressed: playCurrentPlaylist,
//                       ),
//                     ),
//                     PagedSliverList<int, Song>(
//                       pagingController: _pagingController,
//                       builderDelegate: PagedChildBuilderDelegate(
//                         itemBuilder: (context, item, index) => Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 18,
//                             vertical: 6,
//                           ),
//                           child: SearchItemTrack(
//                             height: 60,
//                             provider: widget.provider,
//                             track: item,
//                             onTap: () => replaceWithSong(widget.provider, item),
//                             onDismiss: () => addToQueue(widget.provider, item),
//                             onLoadMore: () => showFloatingModalBottomSheet(
//                               context: context,
//                               builder: (context) =>
//                                   SearchItemModal(track: item),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               MiniPlayer(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// 
// class PlaylistSliverHeader extends StatelessWidget {
//   final SongCollection? playlistDetail;
//   final double height;
//   final bool local;
// 
//   const PlaylistSliverHeader({
//     super.key,
//     required this.height,
//     required this.playlistDetail,
//     required this.local,
//   });
// 
//   @override
//   Widget build(BuildContext context) {
//     final imageWidth = height * 0.9;
// 
//     return SliverAppBar(
//       pinned: true,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       expandedHeight: height * 1.2,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: true,
//         collapseMode: CollapseMode.pin,
//         title: Text(
//           playlistDetail?.name ?? "Playlist Title",
//           style: Theme.of(context).textTheme.headlineSmall,
//         ),
//         background: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: (MediaQuery.of(context).size.width - imageWidth) / 2,
//           ),
//           child: SizedBox.square(
//             dimension: imageWidth,
//             child: CachedNetworkImage(
//               imageUrl: playlistDetail?.cover ?? "",
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         if (local)
//           IconButton(
//             icon: const Icon(Icons.delete_rounded),
//             onPressed: () => showDialog(
//               context: context,
//               builder: (context) => AlertDialog(
//                 title: Text(
//                   AppLocalizations.of(context)!.areYouSureDeletePlaylist,
//                 ),
//                 actions: [
//                   TextButton(
//                     child: Text(AppLocalizations.of(context)!.confirm),
//                     onPressed: () {
//                       if (playlistDetail != null) {
//                         HiveLibrary.removePlaylistByID(playlistDetail!.id);
//                       }
//                       Navigator.of(context).pop();
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
// 
// // class PlaylistHeader extends StatefulWidget {
// //   const PlaylistHeader({super.key});
// 
// //   @override
// //   State<PlaylistHeader> createState() => _PlaylistHeaderState();
// // }
// 
// // class _PlaylistHeaderState extends State<PlaylistHeader> {
// //   final ValueNotifier<List<Color?>?> playerBackgroundGradientColor =
// //       ValueNotifier<List<Color?>?>(GetIt.I<MyTheme>().playGradientColor);
// 
// //   void updateBackgroundColors(List<Color?> value) {
// //     playerBackgroundGradientColor.value = value;
// //     return;
// //   }
// 
// //   @override
// //   Widget build(BuildContext context) {
// //     return ValueListenableBuilder(
// //       valueListenable: playerBackgroundGradientColor,
// //       child: SafeArea(
// //         child: Scaffold(
// //           resizeToAvoidBottomInset: true,
// //           backgroundColor: Colors.transparent,
// //           appBar: AppBar(
// //             elevation: 0,
// //             backgroundColor: Colors.transparent,
// //             centerTitle: true,
// //             leading: IconButton(
// //               icon: const Icon(Icons.expand_more_rounded),
// //               tooltip: AppLocalizations.of(context)!.back,
// //               onPressed: () => Navigator.pop(context),
// //             ),
// //           ),
// //         ),
// //       ),
// //       builder: (context, value, child) => AnimatedContainer(
// //         duration: const Duration(milliseconds: 600),
// //         decoration: BoxDecoration(
// //           gradient: LinearGradient(
// //             begin: Alignment.topCenter,
// //             end: Alignment.bottomCenter,
// //             colors: Theme.of(context).brightness == Brightness.dark
// //                 ? [value?[0] ?? Colors.grey[900]!, value?[1] ?? Colors.black]
// //                 : [value?[0] ?? const Color(0xfff5f9ff), Colors.white],
// //           ),
// //         ),
// //         child: child,
// //       ),
// //     );
// //   }
// // }
// 