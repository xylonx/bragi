import 'package:bragi/Components/cached_network_image_with_error.dart';
import 'package:bragi/Components/floating_modal.dart';
import 'package:bragi/Models/library.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:flutter/material.dart';

class SearchItemModal extends StatelessWidget {
  final Provider provider;
  final Song track;

  const SearchItemModal(
      {super.key, required this.provider, required this.track});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text("Add To Playlist"),
              leading: const Icon(Icons.playlist_add_rounded),
              onTap: () => showFloatingModalBottomSheet(
                  context: context,
                  builder: (context) {
                    final allPlaylists = HiveLibrary.getAllLocalPlaylists();
                    return Material(
                      child: SafeArea(
                        top: false,
                        child: Column(
                          children: List.generate(
                            allPlaylists.length,
                            (index) => ListTile(
                              leading: ImageWithError(
                                imageUri: allPlaylists[index].cover ?? '',
                              ),
                              title: Text(allPlaylists[index].name),
                              onTap: () {
                                HiveLibrary.addTrackToPlaylist(
                                  allPlaylists[index].id,
                                  provider,
                                  track,
                                );
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
