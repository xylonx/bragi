import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:bragi/Models/library.dart';
import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Models/settings.dart';
import 'package:bragi/Services/audio_player.dart';
import 'package:bragi/Services/bragi/client.dart';
import 'package:bragi/Services/player_manager.dart';
import 'package:bragi/Utils/logger.dart';
import 'package:bragi/Utils/theme.dart';
import 'package:bragi/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metadata_god/metadata_god.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;

  await Hive.initFlutter();

  Hive.registerAdapter(ProvidedPlaylistAdapter());

  await Hive.openBox('settings');

  final box = await Hive.openBox<ProvidedPlaylist>(HiveLibrary.playlistBox);

  if (box.length == 0) {
    HiveLibrary.newPlaylist("Liked Songs", "asset::assets/likesong.webp", null);
  }

  // final pd = box.get(defaultPlaylistDetail.id);
  // print('get playlist detail from box by id ${defaultPlaylistDetail.id}: $pd');

  // optimize android experience
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

// init logger
  await initializeLogging();

  // init metadata god for music tagging
  MetadataGod.initialize();

  // init background music player
  final AudioHandler audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: AudioServiceConfig(
      androidNotificationChannelId: 'com.shadow.blackhole.channel.audio',
      androidNotificationChannelName: 'BlackHole',
      androidNotificationIcon: 'drawable/ic_stat_music_note',
      androidShowNotificationBadge: true,
      androidStopForegroundOnPause: false,
      notificationColor: Colors.grey[900],
    ),
  );
  GetIt.I.registerSingleton<AudioHandler>(audioHandler);
  GetIt.I.registerSingleton<PlayerStateManager>(PlayerStateManager());

  // register theme
  GetIt.I.registerSingleton(MyTheme());

  // register bragi client
  GetIt.I.registerFactory<BragiApiClient>(() => BragiApiClient.fromBragi(
      HiveSettings.bragiAddr, HiveSettings.bragiToken));

  runApp(const MyApp());
}
