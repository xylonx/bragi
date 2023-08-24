import 'package:bragi/Components/animated_text.dart';
import 'package:bragi/Components/control_button.dart';
import 'package:bragi/Services/page_manager.dart';
import 'package:bragi/Utils/color.dart';
import 'package:bragi/Utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// TODO(xylonx): make it full
class MiniPlayer extends StatefulWidget {
  static const MiniPlayer _instance = MiniPlayer._internal();

  factory MiniPlayer() {
    return _instance;
  }

  const MiniPlayer._internal();

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  // change background color by track pic
  final ValueNotifier<List<Color?>?> playerBackgroundGradientColor =
      ValueNotifier<List<Color?>?>(GetIt.I<MyTheme>().playGradientColor);

  void updateBackgroundColors(List<Color?> value) {
    playerBackgroundGradientColor.value = value;
    return;
  }

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();

    return ValueListenableBuilder(
      valueListenable: playerBackgroundGradientColor,
      child: ValueListenableBuilder(
        valueListenable: playerManager.currentMediaItemNotifier,
        builder: (context, value, child) {
          getColors(
            imageProvider: CachedNetworkImageProvider(
              value?.artUri.toString() ?? '',
            ),
          ).then(updateBackgroundColors);

          return Dismissible(
            key: Key(value?.id ?? ''),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                playerManager.previous();
              } else {
                playerManager.next();
              }
              return false;
            },
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/player'),
              child: Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 1,
                ),
                elevation: 0,
                color: Colors.transparent,
                child: SizedBox(
                  height: 68,
                  child: Row(
                    children: [
                      SizedBox.square(
                        dimension: 68,
                        child: Hero(
                          tag: value?.id ?? '',
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: value?.artUri.toString() ?? '',
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
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimatedText(
                              text: (value?.displayTitle ?? '').trim(),
                              pauseAfterRound: const Duration(seconds: 2),
                              showFadingOnlyWhenScrolling: false,
                              fadingEdgeStartFraction: 0.1,
                              fadingEdgeEndFraction: 0.1,
                              startAfter: const Duration(seconds: 2),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AnimatedText(
                              text: (value?.displaySubtitle ?? '').trim(),
                              pauseAfterRound: const Duration(seconds: 2),
                              showFadingOnlyWhenScrolling: false,
                              fadingEdgeStartFraction: 0.1,
                              fadingEdgeEndFraction: 0.1,
                              startAfter: const Duration(seconds: 2),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const PlayerPlayButton(width: 32),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      builder: (context, value, child) => AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [value?[0] ?? Colors.grey[900]!, value?[1] ?? Colors.black]
                : [value?[0] ?? const Color(0xfff5f9ff), Colors.white],
          ),
        ),
        child: child,
      ),
    );
  }
}
