import 'package:flutter/material.dart';

class RecommendationPage extends StatefulWidget {
  const RecommendationPage({super.key});

  static const icon = Icon(Icons.home_rounded);

  @override
  State<RecommendationPage> createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("recommendation");
  }
}
