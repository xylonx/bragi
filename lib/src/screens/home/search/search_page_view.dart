import 'package:bragi/src/providers/bragi.dart';
import 'package:bragi/src/services/proto/bragi/bragi.pbenum.dart' as BragiEnum;
import 'package:bragi/src/services/proto/bragi/bragi.pbgrpc.dart';
import 'package:bragi/src/widgets/info/artist.dart';
import 'package:bragi/src/widgets/info/track.dart';
import 'package:bragi/src/widgets/info/track_collection.dart';
import 'package:bragi/src/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  static const routeName = "/search";

  static const icon = Icon(Icons.search_rounded);

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final PagingController<int, SearchResponse_SearchItem> _pagingController =
      PagingController(firstPageKey: 1);

  String keyword = "";

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(keyword, pageKey);
    });
    super.initState();
  }

  void handleSubmitQuery(String query) {
    print("submit query: $query");
    setState(() {
      keyword = query;
      _pagingController.refresh();
    });
  }

  Future<void> _fetchPage(String keyword, int page) async {
    print("get page $page");

    if (keyword.isEmpty) return;

    try {
      BragiServiceClient? client = ref.watch(bragiClientProvider);
      SearchResponse? reply = await client?.search(SearchRequest(
        providers: [BragiEnum.Provider.PROVIDER_BILIBILI],
        keyword: keyword,
        page: page,
          fields: [
            BragiEnum.Zone.ZONE_ARTIST,
            BragiEnum.Zone.ZONE_PLAYLIST,
            BragiEnum.Zone.ZONE_TRACK
          ]
      ));
      _pagingController.appendPage(reply?.items ?? [], page + 1);
    } catch (err) {
      _pagingController.error = err;
    }
  }

  Widget itemBuilder(SearchResponse_SearchItem item) {
    switch (item.whichItem()) {
      case SearchResponse_SearchItem_Item.track:
        return TrackInfoItem(info: item.ensureTrack(), height: 80);
      case SearchResponse_SearchItem_Item.user:
        return ArtistInfoItem(artist: item.ensureUser());
      case SearchResponse_SearchItem_Item.playlist:
        return TrackCollectionItem(playlist: item.ensurePlaylist(), height: 80);
      case SearchResponse_SearchItem_Item.notSet:
        return const SizedBox(height: 80);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SearchBar(
              onSuggestionSelected: handleSubmitQuery,
            ),
          ),
          if (keyword.isNotEmpty)
            Expanded(
              child: PagedListView<int, SearchResponse_SearchItem>(
                scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate(
                  animateTransitions: true,
                  itemBuilder: (context, item, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    child: itemBuilder(item),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
