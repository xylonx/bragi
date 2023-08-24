import 'package:flutter/material.dart';

class UnknownPage extends StatelessWidget {
  final String hint;

  const UnknownPage({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(hint),
        ],
      ),
    );
  }
}
