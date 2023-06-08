import 'package:bragi/src/services/proto/bragi/bragi.pb.dart';
import 'package:bragi/src/utils/provider_icon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProviderAvatar extends StatelessWidget {
  const ProviderAvatar({
    super.key,
    required this.url,
    required this.radius,
    this.provider,
    this.text,
  });

  final String url;
  final double radius;
  final Provider? provider;
  final Widget? text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius,
      width: radius,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  width: radius,
                  height: radius,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
                    size: 0.25 * radius,
                  ),
                ),
            ],
          ),
          if (text != null) text!
        ],
      ),
    );
  }
}
