import 'package:hive/hive.dart';

// ignore: avoid_classes_with_only_static_members
class HiveSettings {
  static const box = 'settings';

  static Box get hivebox => Hive.box(box);

  static String get bragiAddr =>
      hivebox.get('bragi_addr', defaultValue: 'http://192.168.0.183:6000')
          as String;
  static set bragiAddr(String addr) => hivebox.put('bragi_addr', addr);

  static String get bragiToken =>
      hivebox.get('bragi_token', defaultValue: '') as String;

  static set bragiToken(String token) => hivebox.put('bragi_token', token);

  static bool get checkUpdate =>
      hivebox.get('check_update', defaultValue: true) as bool;
  static set checkUpdate(bool checkUpdate) =>
      hivebox.put('check_update', checkUpdate);

  static List<String> get searchHistory => List<String>.from(
        Hive.box(box).get('search_history', defaultValue: []) as List,
      );
  static set searchHistory(List<String> histories) =>
      Hive.box(box).put('search_history', histories);

  static void updateSearchHistory(String query) {
    final history = HiveSettings.searchHistory;
    final idx = history.indexOf(query);
    if (idx > 0) {
      history.removeAt(idx);
    }

    history.insert(0, query);

    HiveSettings.searchHistory = history;
  }

  static void deleteHistory(String query) {
    final history = HiveSettings.searchHistory;
    history.remove(query);

    HiveSettings.searchHistory = history;
  }
}
