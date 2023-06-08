import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';
import 'package:bragi/src/utils/provider_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProviderCachedImage extends StatelessWidget {
  const ProviderCachedImage({
    super.key,
    required this.url,
    required this.length,
    required this.width,
    this.provider,
  });

  final String url;
  final double length;
  final double width;
  final Provider? provider;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: length,
          width: width,
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  width: length,
                  height: length,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              if (provider != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Icon(
                    providerIcons(provider!),
                    size: 0.25 * length,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
