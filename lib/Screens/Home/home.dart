import 'package:bragi/Components/gradient_container.dart';
import 'package:bragi/Components/mini_player.dart';
import 'package:bragi/Screens/Home/home_screen.dart';
import 'package:bragi/Screens/Library/library_screen.dart';
import 'package:bragi/Screens/Search/search_screen.dart';
import 'package:bragi/Screens/Setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _selectedBottomIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void handlePageChange(int index) {
    _selectedBottomIndex.value = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      drawer: const MyDrawer(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      onPageChanged: (value) {
                        _selectedBottomIndex.value = value;
                      },
                      controller: _pageController,
                      children: const [
                        HomeScreen(),
                        SearchScreen(),
                        LibraryScreen(),
                        SettingScreen(),
                      ],
                    ),
                  ),
                  MiniPlayer(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: _selectedBottomIndex,
          builder: (context, value, child) => AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: 60,
            child: SalomonBottomBar(
              currentIndex: value,
              onTap: handlePageChange,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home_rounded),
                  title: Text(AppLocalizations.of(context)!.homePageTitle),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.search_rounded),
                  title: Text(AppLocalizations.of(context)!.searchPageTitle),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.library_music_rounded),
                  title: Text(AppLocalizations.of(context)!.libraryPageTitle),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings_rounded),
                  title: Text(AppLocalizations.of(context)!.settingPageTitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // return GradientContainer(
    // );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GradientContainer(
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              elevation: 0,
              stretch: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.2,
              flexibleSpace: FlexibleSpaceBar(
                title: RichText(
                  text: TextSpan(
                    text: AppLocalizations.of(context)!.appTitle,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'v1.2.3',
                        style: TextStyle(fontSize: 7),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.end,
                ),
                titlePadding: const EdgeInsets.only(bottom: 40.0),
                centerTitle: true,
                background: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.1),
                      ],
                    ).createShader(
                      Rect.fromLTRB(0, 0, rect.width, rect.height),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    image: AssetImage(
                      Theme.of(context).brightness == Brightness.dark
                          ? 'assets/header-dark.jpg'
                          : 'assets/header.jpg',
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  // ABOUT ICON TEXT
                  ListTile(
                    title: Text(AppLocalizations.of(context)!.about),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    leading: Icon(
                      Icons.info_outline_rounded,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 30, 5, 20),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.madeBy,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
