import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';
import 'package:bragi/src/widgets/text/provider_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TrackInfoItem extends StatelessWidget {
  const TrackInfoItem({super.key, required this.info, required this.height});

  final Track info;
  final double height;

  @override
  Widget build(BuildContext context) {
    String title = info.name;
    String subtitle = info.artists.map((e) => e.name).join(",");

    return Slidable(
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) => print("press delete"),
            backgroundColor: const Color.fromARGB(255, 16, 216, 46),
            foregroundColor: Colors.white,
            icon: Icons.queue_music,
            label: 'Queue',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          //TODO(xylonx):
          print("play music $info instantly");
        },
        child: SizedBox(
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  width: height,
                  height: height,
                  child: CachedNetworkImage(
                    imageUrl: info.cover.url,
                    imageBuilder: (context, imageProvider) => Container(
                      width: height,
                      height: height,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    // TODO(xylonx): make artist touchable to enable touch to search feature
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ProviderIcon(provider: info.provider),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(height / 2),
                      ),
                    ),
                    builder: (context) => TrackInfoModal(
                      cover: info.cover.url,
                      title: title,
                      subtitle: subtitle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrackInfoModal extends ConsumerWidget {
  const TrackInfoModal({
    super.key,
    required this.cover,
    required this.title,
    required this.subtitle,
  });

  final String cover;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Modal BottomSheet"),
          ],
        ),
      ),
    );
  }
}
