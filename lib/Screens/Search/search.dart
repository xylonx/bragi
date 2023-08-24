import 'package:bragi/Components/gradient_container.dart';
import 'package:bragi/Components/mini_player.dart';
import 'package:bragi/Components/provider_icons.dart';
import 'package:bragi/Models/settings.dart';
import 'package:bragi/Screens/Search/search_item.dart';
import 'package:bragi/Services/page_manager.dart';
import 'package:bragi/Services/proto/bragi/bragi.pb.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart' as bragi;
import 'package:bragi/Utils/media_converter.dart';
import 'package:bragi/Utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logging/logging.dart';

enum SearchStatus {
  init,
  loading,
  finished,
}

class SearchPage extends StatefulWidget {
  final String query;

  const SearchPage({super.key, required this.query});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final PagingController<int, bragi.SearchResponse_SearchItem>
      _pagingController = PagingController(firstPageKey: 1);
  bool searchSubmit = false;

  final TextEditingController _textEditingController = TextEditingController();
  List<bragi.SearchResponse_SearchItem> searchResult = [];

  final List<String> searchHistory = HiveSettings.searchHistory;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = widget.query;
    _pagingController.addPageRequestListener((pageKey) async {
      await search(_textEditingController.text, pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
    _pagingController.dispose();
  }

  Future<List<bragi.SuggestResponse_Suggestion>> handleTextChange(
    String query,
  ) async {
    final bragi.BragiServiceClient client = GetIt.I<bragi.BragiServiceClient>();
    return (await client.suggest(
      bragi.SuggestRequest(
        providers: [bragi.Provider.PROVIDER_BILIBILI],
        keyword: query,
      ),
    ))
        .suggestions;
  }

  Future<List<bragi.Stream>> handleLoadStream(
    bragi.Provider provider,
    String id,
  ) async {
    final bragi.BragiServiceClient client = GetIt.I<bragi.BragiServiceClient>();
    return (await client.stream(StreamRequest(provider: provider, id: id)))
        .streams
        .where((element) => element.hasAudio())
        .map((e) => e.ensureAudio())
        .toList();
  }

  // FIXME(xylonx): the infinite_scroll_pagination will fetch tons of pages. May be some layout error.
  Future<void> search(String query, int page) async {
    Logger.root.info('submit query $query');

    final bragi.BragiServiceClient client = GetIt.I<bragi.BragiServiceClient>();
    final resp = await client.search(
      bragi.SearchRequest(
        providers: [bragi.Provider.PROVIDER_BILIBILI],
        keyword: query,
        page: page,
        fields: [
          bragi.Zone.ZONE_ARTIST,
          bragi.Zone.ZONE_PLAYLIST,
          bragi.Zone.ZONE_TRACK,
        ],
      ),
    );

    if (page == 1) {
      resp.items.insert(0, SearchResponse_SearchItem());
    }

    if (page >= 1) {
      _pagingController.appendLastPage(resp.items);
    } else {
      _pagingController.appendPage(resp.items, page + 1);
    }
  }

  Widget searchItemBuilder(
    BuildContext context,
    bragi.SearchResponse_SearchItem item,
    int index,
  ) {
    switch (item.whichItem()) {
      case bragi.SearchResponse_SearchItem_Item.track:
        final track = item.ensureTrack();
        return SearchItemTrack(
          height: 60,
          track: track,
          onTap: () async {
            final playerManager = GetIt.I<PlayerStateManager>();
            final streams = await handleLoadStream(track.provider, track.id);
            // FIXME(xylonx): should convert it to play now
            // playerManager
            playerManager.insertFirst(
              MediaConverter.track2MediaItem(track, streams),
            );
            Navigator.pushNamed(context, '/player');
          },
          onLoadMore: () {
            Snackbar.show(
              context,
              'load more for track ${item.ensureTrack().name}',
            );
          },
        );
      case bragi.SearchResponse_SearchItem_Item.user:
        return SearchItemArtist(
          height: 60,
          artist: item.ensureUser(),
          onTap: () {
            Snackbar.show(context, 'Artist detail is not supported now');
          },
        );
      case bragi.SearchResponse_SearchItem_Item.playlist:
        return SearchItemPlaylist(
          playlist: item.ensurePlaylist(),
          height: 60,
          onTap: () => Navigator.pushNamed(
            context,
            '/playlist',
            arguments: {
              'id': item.ensurePlaylist().id,
              'provider': item.ensurePlaylist().provider,
            },
          ),
        );
      default:
        return const SizedBox(height: 60);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    if (searchSubmit)
                      PagedListView<int, bragi.SearchResponse_SearchItem>(
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, item, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 6,
                            ),
                            child: searchItemBuilder(context, item, index),
                          ),
                        ),
                      ),

                    // TODO(xylonx): there are some bugs here
                    SearchHistory(
                      onTap: (query) async {
                        _pagingController.refresh();
                        setState(() {
                          searchSubmit = true;
                          searchHistory.insert(0, query);
                        });
                        _textEditingController.text = query;
                      },
                    ),

                    // search bar
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).cardColor,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(1.5, 1.5),
                          )
                        ],
                      ),
                      child: TypeAheadFormField(
                        debounceDuration: const Duration(microseconds: 500),
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: _textEditingController,
                          decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.secondary,
                            prefixIcon: const Icon(Icons.search),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onSubmitted: (value) async {
                            _pagingController.refresh();
                            setState(() {
                              searchSubmit = true;
                            });
                          },
                        ),
                        suggestionsCallback: handleTextChange,
                        itemBuilder: (context, itemData) => Padding(
                          padding: const EdgeInsets.fromLTRB(8, 5, 10, 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  ProviderIcons.icons(itemData.provider),
                                ),
                              ),
                              Text(itemData.suggestion),
                            ],
                          ),
                        ),
                        onSuggestionSelected: (suggestion) {
                          _pagingController.refresh();
                          setState(() {
                            searchSubmit = true;
                            searchHistory.insert(0, suggestion.suggestion);
                          });
                          _textEditingController.text = suggestion.suggestion;
                        },
                      ),
                    )
                  ],
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

class SearchHistory extends StatefulWidget {
  final Future<void> Function(String) onTap;

  const SearchHistory({super.key, required this.onTap});

  @override
  State<SearchHistory> createState() => _SearchHistoryState();
}

class _SearchHistoryState extends State<SearchHistory> {
  final List<String> searchHistory = HiveSettings.searchHistory;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              children: List<Widget>.generate(
                searchHistory.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    child: Chip(
                      label: Text(searchHistory[index]),
                      labelStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                        fontWeight: FontWeight.normal,
                      ),
                      onDeleted: () {
                        setState(() {
                          searchHistory.removeAt(index);
                          HiveSettings.searchHistory = searchHistory;
                        });
                      },
                    ),
                    onTap: () async {
                      setState(() {
                        final String query =
                            searchHistory.removeAt(index).trim();
                        searchHistory.insert(0, query);
                        HiveSettings.searchHistory = searchHistory;
                      });
                      await widget.onTap(searchHistory[0]);
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
