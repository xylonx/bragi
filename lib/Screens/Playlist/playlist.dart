import 'package:bragi/Components/gradient_container.dart';
import 'package:bragi/Components/mini_player.dart';
import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Screens/Search/search_item.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart' as bragi;
import 'package:bragi/Utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logging/logging.dart';

class PlaylistPage extends StatefulWidget {
  final bragi.Provider provider;
  final String id;

  final bool local;

  const PlaylistPage({
    super.key,
    required this.provider,
    required this.id,
    required this.local,
  });

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final PagingController<int, bragi.Track> _pagingController =
      PagingController(firstPageKey: 1);

  bragi.PlaylistDetail? playlistDetail;

  bool fetched = false;

  Future<bragi.PlaylistDetail?> _fetchPlaylist(
    bragi.Provider provider,
    String id,
  ) async {
    try {
      // USED FOR HOOK
      return defaultPlaylistDetail;

      // final client = GetIt.I<BragiServiceClient>();
      // final resp = await client.detail(
      //   DetailRequest(provider: widget.provider, id: widget.id, page: 1),
      // );
      // return resp.item.ensurePlaylist();
    } catch (e) {
      Logger.root.info('fetch playlist failed');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fetchPlaylist(widget.provider, widget.id).then(
      (value) => {
        setState(() {
          fetched = true;
          playlistDetail = value;
          _pagingController.appendLastPage(value?.tracks ?? []);
        })
      },
    );

    return GradientContainer(
      child: Column(
        children: [
          Expanded(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  if (!fetched)
                    const Center(child: CircularProgressIndicator())
                  else
                    CustomScrollView(
                      slivers: <Widget>[
                        PagedSliverList<int, bragi.Track>(
                          pagingController: _pagingController,
                          builderDelegate: PagedChildBuilderDelegate(
                            itemBuilder: (context, item, index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 6,
                              ),
                              child: SearchItemTrack(height: 60, track: item),
                            ),
                          ),
                        ),
                      ],
                    ),

                  // CustomScrollView(
                  //   controller: _scrollController,
                  //   physics: const BouncingScrollPhysics(),
                  //   slivers: [
                  //     AnimatedPlaylistHeader(
                  //       scrollController: _scrollController,
                  //       imageUrl: playlistDetail?.cover.url,
                  //     ),
                  //     SliverList(
                  //       delegate: SliverChildListDelegate([]),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}

class AnimatedPlaylistHeader extends StatelessWidget {
  final ScrollController scrollController;
  final String? imageUrl;

  const AnimatedPlaylistHeader({
    super.key,
    required this.scrollController,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.width * 0.6;
    final double screenWidth = MediaQuery.of(context).size.width * 0.5;

    return AnimatedBuilder(
      animation: scrollController,
      child: FlexibleSpaceBar(
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: screenWidth,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl ?? '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      builder: (context, child) => SliverAppBar(
        elevation: 0,
        stretch: true,
        pinned: true,
        centerTitle: true,
        backgroundColor:
            scrollController.offset.roundToDouble() > expandedHeight - 80
                ? null
                : Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
        expandedHeight: expandedHeight,
        actions: [
          // PopupMenuButton(itemBuilder: itemBuildeIr)
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert_rounded),
          ),
        ],
        flexibleSpace: child,
      ),
    );
  }
}

// ------

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  final MyTheme currentTheme = GetIt.I<MyTheme>();

  // change background color by track pic
  final ValueNotifier<List<Color?>?> backgroundGradientColor =
      ValueNotifier<List<Color?>?>(GetIt.I<MyTheme>().playGradientColor);

  void updateBackgroundColors(List<Color?> value) {
    backgroundGradientColor.value = value;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: backgroundGradientColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.expand_more_rounded),
              tooltip: AppLocalizations.of(context)!.back,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          // body: LayoutBuilder(
          //   // TODO(xylonx):
          //   builder: (context, constraints) {},
          // ),
        ),
      ),
      builder: (context, value, child) => AnimatedContainer(
        duration: const Duration(microseconds: 600),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [value?[0] ?? Colors.grey[900]!, value?[1] ?? Colors.black]
                : [value?[0] ?? const Color(0xfff5f9ff), Colors.white],
          ),
        ),
        child: child,
      ),
    );
  }
}
