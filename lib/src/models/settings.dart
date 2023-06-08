import 'package:hive_flutter/hive_flutter.dart';

import 'hivebox.dart';

part 'settings.g.dart';

// FIXME(xylonx):

// split settings into multiple part to use
class HiveSetting extends HiveThemeSettings with HiveBragiSettings {
  static Future<void> openBox() async {
    await openHiveBox("themeSettings");
    await openHiveBox("bragiSettings");
  }
}

class HiveThemeSettings {
  static themeListenable() => Hive.box("settings").listenable;

  bool getIsa() {
    return true;
  }

  static bool get isDarkMode =>
      Hive.box("themeSettings").get("dartMode", defaultValue: true) as bool;
  static set isDarkMode(bool isDark) =>
      Hive.box('themeSettings').put('darkMode', isDark);
}

class HiveBragiSettings {
  static bragiListenable() => Hive.box("settings").listenable;

  static bool get isDarkMode =>
      Hive.box("bragiSettings").get("dartMode", defaultValue: true) as bool;
  static set isDarkMode(bool isDark) =>
      Hive.box('bragiSettings').put('darkMode', isDark);
}

@HiveType(typeId: 1)
class Settings {
  @HiveField(0)
  late String bragiHost;

  @HiveField(1)
  late String bragiPort;

  Settings();
}
