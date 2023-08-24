import 'package:bragi/Screens/Home/home.dart';
import 'package:bragi/Screens/Player/player.dart';
import 'package:bragi/Screens/Playlist/playlist.dart';
import 'package:bragi/Screens/Search/search.dart';
import 'package:bragi/Screens/Unknown/unknown.dart';
import 'package:bragi/Services/page_manager.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart';
import 'package:bragi/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

/// Called when Doing Background Work initiated from Widget
@pragma('vm:entry-point')
Future<void> backgroundCallback(Uri? data) async {
  if (data?.host == 'controls') {
    if (data?.path == '/play') {
      // audioHandler?.play();
    } else if (data?.path == '/pause') {
      // audioHandler?.pause();
    } else if (data?.path == '/skipNext') {
      // audioHandler?.skipToNext();
    } else if (data?.path == '/skipPrevious') {
      // audioHandler?.skipToPrevious();
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Locale _locale = const Locale('en', '');

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    GetIt.I<PlayerStateManager>().init();

    // HomeWidget.setAppGroupId('com.xylonx.bragi');
    // TODO(xylonx): recv callback
    // HomeWidget.registerBackgroundCallback(backgroundCallback);

    // if (LanguageCodes.languageCodes.values.contains(systemLangCode)) {
    //   _locale = Locale(systemLangCode);
    // } else {
    //   final String lang =
    //       Hive.box('settings').get('lang', defaultValue: 'English') as String;
    //   _locale = Locale(LanguageCodes.languageCodes[lang] ?? 'en');
    // }

    AppTheme.currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    GetIt.I<PlayerStateManager>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: AppTheme.themeMode == ThemeMode.system
            ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                ? Brightness.light
                : Brightness.dark
            : AppTheme.themeMode == ThemeMode.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarIconBrightness:
            AppTheme.themeMode == ThemeMode.system
                ? MediaQuery.platformBrightnessOf(context) == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark
                : AppTheme.themeMode == ThemeMode.dark
                    ? Brightness.light
                    : Brightness.dark,
      ),
      child: MaterialApp(
        title: 'Bragi',
        restorationScopeId: 'Bragi',
        debugShowCheckedModeBanner: false,
        themeMode: AppTheme.themeMode,
        theme: AppTheme.lightTheme(context: context),
        darkTheme: AppTheme.darkTheme(context: context),
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        routes: {
          '/': (context) => const HomePage(),
          // '/playlists': (context) => PlaylistsScreen(),
          // '/nowplaying': (context) => NowPlayingScreen(),
          '/player': (context) => const PlayerPage(),
          // '/recent': (context) => RecentPlayedScreen(),
          // '/about': (context) => AboutScreen(),
          // TODO(xylonx): add statistics here
          // '/statistics': (context) => StatisticsScreen(),
        },
        navigatorKey: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          final args = (settings.arguments ?? {}) as Map;
          switch (settings.name) {
            case '/search':
              return MaterialPageRoute(
                builder: (context) =>
                    SearchPage(query: args['query'] as String),
              );
            case '/playlist':
              return MaterialPageRoute(
                builder: (context) => PlaylistPage(
                  provider: args['provider'] as Provider,
                  id: args['id'] as String,
                  local: args['local'] as bool,
                ),
              );
            default:
              return MaterialPageRoute(
                builder: (context) =>
                    UnknownPage(hint: 'Unknown Router\n${settings.name}'),
              );
          }
        },
      ),
    );
  }
}
