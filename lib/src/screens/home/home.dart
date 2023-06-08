import 'package:bragi/src/screens/home/library/library_page_view.dart';
import 'package:bragi/src/screens/home/recommendation/recommendation_page_view.dart';
import 'package:bragi/src/screens/home/search/search_page_view.dart';
import 'package:bragi/src/screens/home/setting/setting_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SalomonBottomBarItem> buildBottomBarItems(BuildContext context) {
    return [
      SalomonBottomBarItem(
        icon: RecommendationPage.icon,
        title: Text(AppLocalizations.of(context)!.homePageTitle),
      ),
      SalomonBottomBarItem(
        icon: SearchPage.icon,
        title: Text(AppLocalizations.of(context)!.searchPageTitle),
      ),
      SalomonBottomBarItem(
        icon: LibraryPage.icon,
        title: Text(AppLocalizations.of(context)!.libraryPageTitle),
      ),
      SalomonBottomBarItem(
        icon: SettingPage.icon,
        title: Text(AppLocalizations.of(context)!.settingPageTitle),
      ),
    ];
  }

  int _selectedBottomIndex = 0;
  PageController pageController = PageController();

  void handlePageChange(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  void handleBottomBarItemTap(int index) {
    setState(() {
      _selectedBottomIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => handlePageChange(index),
        children: const [
          RecommendationPage(),
          SearchPage(),
          LibraryPage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar:
          // kIsDesktop
          // ? null
          // :
          SafeArea(
        child: AnimatedContainer(
          duration: const Duration(microseconds: 100),
          height: 60,
          child: SalomonBottomBar(
            currentIndex: _selectedBottomIndex,
            selectedItemColor: const Color(0xff6200ee),
            unselectedItemColor: const Color(0xff757575),
            onTap: (index) => handleBottomBarItemTap(index),
            items: buildBottomBarItems(context),
          ),
        ),
      ),
    );
  }
}
