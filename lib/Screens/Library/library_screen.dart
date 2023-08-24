import 'package:bragi/Models/library.dart';
import 'package:bragi/Services/proto/bragi/bragi.pbgrpc.dart' as bragi;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
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
                  onTextChanged: (s) {},
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Wrap(
            spacing: 8,
            children: [FilterChip(label: Text('Playlist'), onSelected: (s) {})],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Liked Artist'),
              Text(
                "Liked Playlist",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              ValueListenableBuilder(
                valueListenable:
                    Hive.box<bragi.PlaylistDetail>(HiveLibrary.playlistBox)
                        .listenable(),
                builder: (context, value, child) => SizedBox(
                  height: 110,
                  child: ListView.separated(
                    itemCount: value.length,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      child: SizedBox.square(
                        dimension: 100,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: value.getAt(index)?.cover.url ?? '',
                          errorWidget: (context, url, error) => const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/cover.jpg'),
                          ),
                          placeholder: (context, url) => const Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/cover.jpg'),
                          ),
                        ),
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/playlist',
                        arguments: {
                          'local': true,
                          'id': value.getAt(index)?.id,
                          'provider': bragi.Provider.PROVIDER_UNSPECIFIED,
                        },
                      ),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 22),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddPlaylistDialog extends StatelessWidget {
  final void Function(String) onTextChanged;

  const AddPlaylistDialog({super.key, required this.onTextChanged});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Playlist'),
      content: TextField(
        onChanged: onTextChanged,
      ),
      actions: [],
    );
  }
}
