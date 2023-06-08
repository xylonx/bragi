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
  final PagingController<int, SearchReplay_SearchItem> _pagingController =
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
      BragiClient? client = ref.watch(bragiClientProvider);
      SearchReplay? reply = await client?.search(SearchRequest(
        providers: [BragiEnum.Provider.PROVIDER_BILIBILI],
        keyword: keyword,
        page: page,
      ));
      _pagingController.appendPage(reply?.items ?? [], page + 1);
    } catch (err) {
      _pagingController.error = err;
    }
  }

  Widget itemBuilder(SearchReplay_SearchItem item) {
    switch (item.whichItem()) {
      case SearchReplay_SearchItem_Item.track:
        return TrackInfoItem(info: item.ensureTrack());
      case SearchReplay_SearchItem_Item.user:
        return ArtistInfoItem(artist: item.ensureUser());
      case SearchReplay_SearchItem_Item.playlist:
        return TrackCollectionItem(playlist: item.ensurePlaylist());

      // TODO: Handle this case.
      case SearchReplay_SearchItem_Item.album:
      case SearchReplay_SearchItem_Item.notSet:
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
              child: PagedListView<int, SearchReplay_SearchItem>(
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
