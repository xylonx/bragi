import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NestedScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const AnimatedGreet(),
            AnimatedSearchBar(scrollController: _scrollController),
          ],
          body: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            // TODO(xylonx): change params for below components
            children: [
              // RecentPlaylist(),
              LastSession(recentList: []),
            ],
          ),
        ),
        Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 0, 0),
            child: Transform.rotate(
              angle: 22 / 7 * 2,
              child: IconButton(
                icon: const Icon(Icons.horizontal_split_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedGreet extends StatelessWidget {
  const AnimatedGreet({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 135,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 65,
      automaticallyImplyLeading: false,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) => FlexibleSpaceBar(
          background: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 60),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      AppLocalizations.of(context)!.greet,
                      style: TextStyle(
                        letterSpacing: 2,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedSearchBar extends StatelessWidget {
  final ScrollController scrollController;
  const AnimatedSearchBar({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      stretch: true,
      toolbarHeight: 65,
      title: Align(
        alignment: Alignment.centerRight,
        child: AnimatedBuilder(
          animation: scrollController,
          builder: (context, child) => GestureDetector(
            child: AnimatedContainer(
              width: (!scrollController.hasClients ||
                      scrollController.positions.length > 1)
                  ? MediaQuery.of(context).size.width
                  : max(
                      MediaQuery.of(context).size.width -
                          scrollController.offset.roundToDouble(),
                      MediaQuery.of(context).size.width - 75,
                    ),
              height: 55,
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                    offset: Offset(1.5, 1.5),
                  )
                ],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(
                    Icons.search_rounded,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context)!.searchText,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(
              context,
              '/search',
              arguments: {'query': ''},
            ),
          ),
        ),
      ),
    );
  }
}

class LastSession extends StatelessWidget {
  final List recentList;

  const LastSession({super.key, required this.recentList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
              child: Text(
                AppLocalizations.of(context)!.lastSession,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
          // TODO(xylonx): add last session function
        ),
      ],
    );
  }
}

class RecentPlaylist extends StatelessWidget {
  const RecentPlaylist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
