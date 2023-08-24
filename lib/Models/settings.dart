import 'package:hive/hive.dart';

// ignore: avoid_classes_with_only_static_members
class HiveSettings {
  static const box = 'settings';

  static Box get hivebox => Hive.box(box);

  static String get bragiHost =>
      hivebox.get('bragi_host', defaultValue: '192.168.178.150') as String;
  static set bragiHost(String host) => hivebox.put('bragi_host', bragiHost);

  static int get bragiPort =>
      hivebox.get('bragi_port', defaultValue: 6000) as int;
  static set bragiPort(int port) => hivebox.put('bragi_port', bragiHost);

  static bool get checkUpdate =>
      hivebox.get('check_update', defaultValue: true) as bool;
  static set checkUpdate(bool checkUpdate) =>
      hivebox.put('check_update', checkUpdate);

  static List<String> get searchHistory => List<String>.from(
        Hive.box(box).get('search_history', defaultValue: []) as List,
      );
  static set searchHistory(List<String> histories) =>
      Hive.box(box).put('search_history', histories);
}
