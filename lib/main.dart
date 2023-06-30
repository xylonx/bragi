import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:window_manager/window_manager.dart';

import 'src/app.dart';
import 'src/providers/bragi.dart';
import 'src/services/audio/mobile_audio_service.dart';
import 'src/services/proto/bragi/bragi.pbgrpc.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'src/utils/platform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // register persisted hive adapter
  await Hive.initFlutter();
  // Hive.registerAdapter(HiveCredentialsAdapter());
  // Hive.registerAdapter(HiveSettingsAdapter());
  // HiveSetting.openBox();

  if (kIsDesktop) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      center: true,
      backgroundColor: Colors.transparent,
      titleBarStyle: TitleBarStyle.hidden,
      title: "Bragi",
    );
    // setWIndowsM
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      // TODO(xylonx): set windows size
      // await windowManager.setSize(Size(10, 10));
      await windowManager.show();
    });
  }

  var audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.xylonx.bragi.channel.audio',
      androidNotificationChannelName: 'Music playback',
    ),
  );
  print("register audio handler");
  GetIt.I.registerSingleton<MyAudioHandler>(audioHandler);

  // MobileAudioService? mobileAudioService;

  // init singleton grpc client
  // TODO(xylonx): listen settings change and override the client
  // GetIt.I.registerSingleton<GrpcService>(GrpcService(
  //   bragiClient: BragiClient(
  //     ClientChannel(
  //       "localhost",
  //       port: 5000,
  //       options:
  //           const ChannelOptions(credentials: ChannelCredentials.insecure()),
  //     ),
  //   ),
  // ));

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(ProviderScope(
    overrides: [
      bragiClientProvider.overrideWith(
        (ref) => BragiClientNotifer(
          BragiServiceClient(
            ClientChannel(
              "localhost",
              port: 6000,
              options: const ChannelOptions(
                credentials: ChannelCredentials.insecure(),
              ),
            ),
          ),
        ),
      )
    ],
    child: MyApp(settingsController: settingsController),
  ));
}
