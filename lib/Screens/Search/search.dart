import 'package:bragi/Components/floating_modal.dart';
import 'package:bragi/Components/gradient_container.dart';
import 'package:bragi/Components/mini_player.dart';
import 'package:bragi/Components/provider_icons.dart';
import 'package:bragi/Models/settings.dart';
import 'package:bragi/Screens/Search/search_item.dart';
import 'package:bragi/Screens/Search/search_item_modal.dart';
import 'package:bragi/Services/bragi/client.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:bragi/Services/playlist_manager.dart';
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
  final PagingController<int, ScrapeItem> _pagingController =
      PagingController(firstPageKey: 1);
  bool searchSubmit = false;

  final TextEditingController _textEditingController = TextEditingController();
  List<ScrapeItem> searchResult = [];

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

  Future<List<WithProvider<String>>> handleTextChange(
    String query,
  ) async {
    final client = GetIt.I<BragiApiClient>();
    return await client.suggest(query);
  }

  Future<void> search(String query, int page) async {
    Logger.root.info('submit query $query');

    HiveSettings.updateSearchHistory(query);

    final client = GetIt.I<BragiApiClient>();
    final searchItems = await client.search(query, SearchType.all);

    _pagingController.appendLastPage(searchItems);
  }

  Widget searchItemBuilder(
    BuildContext context,
    ScrapeItem item,
  ) {
    final provider = item.provider;

    if (item.data is Song) {
      final song = item.data as Song;
      return SearchItemTrack(
        height: 60,
        provider: provider,
        track: song,
        onTap: () {
          replaceWithSong(provider, song);
          Navigator.pushNamed(context, '/player');
        },
        onDismiss: () => addToQueue(provider, song),
        onLoadMore: () => showFloatingModalBottomSheet(
          context: context,
          builder: (context) => SearchItemModal(
            provider: provider,
            track: song,
          ),
        ),
      );
    } else if (item.data is Artist) {
      final artist = item.data as Artist;
      return SearchItemArtist(
        height: 60,
        provider: provider,
        artist: artist,
        onTap: () {
          Snackbar.show(context, 'Artist detail is not supported now');
        },
      );
    } else if (item.data is SongCollection) {
      final collection = item.data as SongCollection;
      return SearchItemPlaylist(
        provider: provider,
        playlist: collection,
        height: 60,
        onTap: () => Navigator.pushNamed(
          context,
          '/playlist',
          arguments: {
            'id': collection.id,
            'provider': provider,
            'local': false,
          },
        ),
      );
    } else {
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
                      PagedListView<int, ScrapeItem>(
                        pagingController: _pagingController,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, item, index) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 6,
                            ),
                            child: searchItemBuilder(context, item),
                          ),
                        ),
                      ),

                    if (!searchSubmit)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SearchHistory(
                          onTap: (query) async {
                            _pagingController.refresh();
                            setState(() {
                              searchSubmit = true;
                            });
                            _textEditingController.text = query;
                          },
                        ),
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
                              Text(
                                itemData.data,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        onSuggestionSelected: (suggestion) {
                          _pagingController.refresh();
                          setState(() {
                            searchSubmit = true;
                          });
                          _textEditingController.text = suggestion.data;
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
                          final query = searchHistory.removeAt(index).trim();
                          HiveSettings.deleteHistory(query);
                        });
                      },
                    ),
                    onTap: () async {
                      setState(() {
                        final query = searchHistory.removeAt(index).trim();
                        searchHistory.insert(0, query);
                        HiveSettings.updateSearchHistory(query);
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
