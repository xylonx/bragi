import 'package:bragi/src/services/audio/mobile_audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  static const icon = Icon(Icons.home_rounded);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    MyAudioHandler handler = GetIt.I.get<MyAudioHandler>();
    return Scaffold(
      appBar: AppBar(title: const Text("player")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: handler.play, child: const Text("play")),
            ElevatedButton(onPressed: handler.pause, child: const Text("pause")),
          ],
        ),
      ),
    );
  }
}
