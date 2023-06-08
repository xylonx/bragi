import 'package:flutter/material.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      elevation: 0,
      child: SizedBox(
        height: 68,
        child: ListTile(
          // TODO(xylonx): maybe define all the named router once and call it
          onTap: () => Navigator.pushNamed(context, "/player"),
          // TODO(xylonx): change the below fields as current playing one
          title: const Text("track title"),
          subtitle: const Text("artist"),
          trailing: IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              print("like it");
            },
          ),
        ),
      ),
    );
  }
}
