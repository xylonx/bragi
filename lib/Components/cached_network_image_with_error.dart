import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWithError extends StatelessWidget {
  final String imageUri;
  final ImageWidgetBuilder? imageBuilder;

  const ImageWithError({
    super.key,
    required this.imageUri,
    this.imageBuilder,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUri.startsWith("asset::")) {
      return Image.asset(imageUri.replaceFirst("asset::", ""));
    }

    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: imageUri,
      imageBuilder: imageBuilder,
      errorWidget: (context, url, error) => const Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/cover.jpg'),
      ),
      placeholder: (context, url) => const Image(
        fit: BoxFit.cover,
        image: AssetImage('assets/cover.jpg'),
      ),
    );
  }
}


// class CachedNetworkImageWithError extends StatelessWidget {
//   final String imageUrl;
//   final ImageWidgetBuilder? imageBuilder;

//   const CachedNetworkImageWithError({
//     super.key,
//     required this.imageUrl,
//     this.imageBuilder,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return CachedNetworkImage(
//       fit: BoxFit.cover,
//       imageUrl: imageUrl,
//       imageBuilder: imageBuilder,
//       errorWidget: (context, url, error) => const Image(
//         fit: BoxFit.cover,
//         image: AssetImage('assets/cover.jpg'),
//       ),
//       placeholder: (context, url) => const Image(
//         fit: BoxFit.cover,
//         image: AssetImage('assets/cover.jpg'),
//       ),
//     );
//   }
// }
