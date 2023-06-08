import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';
import 'package:bragi/src/widgets/text/provider_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShortInfoItem extends StatelessWidget {
  const ShortInfoItem({
    super.key,
    required this.id,
    required this.coverUrl,
    required this.title,
    required this.subtitle,
    required this.provider,
    required this.onTap,
  });

  final String id;
  final String coverUrl;
  final String title;
  final String subtitle;
  final Provider provider;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: SizedBox(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: coverUrl,
                imageBuilder: (context, imageProvider) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
            child: ProviderIcon(provider: provider),
          ),
        ],
      ),
    );
  }
}
