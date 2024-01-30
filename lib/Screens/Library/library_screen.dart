import 'package:bragi/Models/library.dart';
import 'package:bragi/Models/playlist.dart';
import 'package:bragi/Screens/Search/search_item.dart';
import 'package:bragi/Services/bragi/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  bool enablePlaylists = true;
  bool enableArtists = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.library,
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 4,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => Transform.rotate(
            angle: 22 / 7 * 2,
            child: IconButton(
              color: Theme.of(context).iconTheme.color,
              icon: const Icon(Icons.horizontal_split_rounded),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: AppLocalizations.of(context)!.add,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AddPlaylistDialog(
                  onSubmit: (v) => HiveLibrary.newPlaylist(v, null, null),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.clear_all_rounded),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(AppLocalizations.of(context)!.areYouSureDeleteAll),
                actions: [
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.confirm),
                    onPressed: () {
                      HiveLibrary.removeAll();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Wrap(
            spacing: 8,
            children: [
              FilterChip(
                label: Text(AppLocalizations.of(context)!.playlists),
                selected: true,
                onSelected: (s) {
                  setState(() {
                    enablePlaylists = s;
                  });
                },
              ),
              FilterChip(
                label: Text(AppLocalizations.of(context)!.artists),
                selected: true,
                onSelected: (s) {
                  setState(() {
                    enableArtists = s;
                  });
                },
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (enablePlaylists)
                ValueListenableBuilder(
                  valueListenable:
                      Hive.box<ProvidedPlaylist>(HiveLibrary.playlistBox)
                          .listenable(),
                  builder: (context, value, child) => Expanded(
                    child: ListView.builder(
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          final playlist = value.getAt(index);
                          if (playlist != null) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 6,
                              ),
                              child: SearchItemPlaylist(
                                provider: playlist.isLocal
                                    ? Provider.local
                                    : playlist.provider!,
                                playlist: playlist.toSongCollection(),
                                height: 60,
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  "/playlist",
                                  arguments: {
                                    "local": playlist.isLocal,
                                    "id": playlist.id,
                                    "provider": playlist.provider
                                  },
                                ),
                              ),
                            );
                          }
                          return null;
                        }),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class AddPlaylistDialog extends StatefulWidget {
  final Function(String) onSubmit;

  const AddPlaylistDialog({super.key, required this.onSubmit});

  @override
  State<AddPlaylistDialog> createState() => _AddPlaylistDialogState();
}

class _AddPlaylistDialogState extends State<AddPlaylistDialog> {
  final TextEditingController _textFieldController = TextEditingController();

  String? playlistName;

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.addPlaylist),
      content: TextField(
        onChanged: (v) {
          setState(() {
            playlistName = v;
          });
        },
        controller: _textFieldController,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.playlistName,
        ),
      ),
      actions: [
        MaterialButton(
          child: Text(AppLocalizations.of(context)!.confirm),
          onPressed: () {
            if (playlistName != null && playlistName!.trim().isNotEmpty) {
              widget.onSubmit(playlistName!);
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
