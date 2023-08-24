import 'dart:io';

import 'package:audio_service/audio_service.dart';
import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Models/settings.dart';
import 'package:bragi/Services/audio_player.dart';
import 'package:bragi/Services/page_manager.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart';
import 'package:bragi/Utils/logger.dart';
import 'package:bragi/Utils/theme.dart';
import 'package:bragi/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:metadata_god/metadata_god.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;

  print('will init flutter');
  await Hive.initFlutter();

  print('will register playlist detail adapter');
  Hive.registerAdapter(PlaylistDetailAdapter());

  await Hive.openBox('settings');

  final box = await Hive.openBox<PlaylistDetail>('playlists');

  if (box.length == 0) {
    print('will put default playlist detail');
    // FIXME(xylonx): change to liked music
    box.put(defaultPlaylistDetail.id, defaultPlaylistDetail);
  }

  final pd = box.get(defaultPlaylistDetail.id);
  print('get playlist detail from box by id ${defaultPlaylistDetail.id}: $pd');

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

  // register grpc client
  GetIt.I.registerFactory<BragiServiceClient>(() {
    return BragiServiceClient(
      ClientChannel(
        HiveSettings.bragiHost,
        port: HiveSettings.bragiPort,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
  });

  runApp(const MyApp());
}
