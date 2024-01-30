import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:bragi/Components/animated_text.dart';
import 'package:bragi/Components/cached_network_image_with_error.dart';
import 'package:bragi/Components/control_button.dart';
import 'package:bragi/Services/notifiers/progress_notifier.dart';
import 'package:bragi/Services/player_manager.dart';
import 'package:bragi/Utils/color.dart';
import 'package:bragi/Utils/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final MyTheme currentTheme = GetIt.I<MyTheme>();

  // change background color by track pic
  final ValueNotifier<List<Color?>?> playerBackgroundGradientColor =
      ValueNotifier<List<Color?>?>(GetIt.I<MyTheme>().playGradientColor);

  void updateBackgroundColors(List<Color?> value) {
    playerBackgroundGradientColor.value = value;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.down,
      background: const ColoredBox(color: Colors.transparent),
      key: const Key('PlayerPage'),
      onDismissed: (direction) => Navigator.pop(context),
      child: ValueListenableBuilder(
        valueListenable: playerBackgroundGradientColor,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.expand_more_rounded),
                tooltip: AppLocalizations.of(context)!.back,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            body: LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: constraints.maxHeight * 0.05,
                    ),
                    child: CurrentSongInfo(
                      artSize: constraints.maxWidth * 0.85,
                      titleFontSize: 25,
                      subtitleFontSize: 18,
                      onSongInfoChange: (mediaItem) {
                        getColors(
                          imageProvider: CachedNetworkImageProvider(
                            mediaItem?.artUri.toString() ?? '',
                          ),
                        ).then(updateBackgroundColors);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.15 / 2,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const PlayerPlaylistButton(width: 25),
                        const Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PlayerChangeSourceButton(),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.download_rounded),
                          onPressed: () {
                            // TODO(xylonx): download musics
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: constraints.maxWidth * 0.02,
                      bottom: constraints.maxWidth * 0.04,
                    ),
                    child: AudioProgressBar(
                      width: constraints.maxWidth * 0.85,
                      height: 32,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.15 / 2,
                    ),
                    child: const Row(
                      children: [
                        PlayerRepeatButton(width: 25),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PlayerPreviousButton(width: 40),
                              PlayerPlayButton(width: 40),
                              PlayerNextSongButton(width: 40),
                            ],
                          ),
                        ),
                        PlayerShuffleButton(width: 25),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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
      ),
    );
  }
}

class CurrentArtwork extends StatelessWidget {
  final String id;
  final String imageUrl;

  final double width;

  const CurrentArtwork({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: width,
      child: Hero(
        tag: id,
        child: FlipCard(
          onFlipDone: (v) {},
          front: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            clipBehavior: Clip.antiAlias,
            child: ImageWithError(imageUri: imageUrl),
          ),
          back: const SizedBox(
            child: Text("(WIP) lyrics"),
          ),
        ),
      ),
    );
  }
}

class CurrentSongInfo extends StatelessWidget {
  final double artSize;
  final double titleFontSize;
  final double subtitleFontSize;

  final void Function(MediaItem?)? onSongInfoChange;

  const CurrentSongInfo({
    super.key,
    required this.artSize,
    required this.titleFontSize,
    required this.subtitleFontSize,
    this.onSongInfoChange,
  });

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();
    return ValueListenableBuilder(
      valueListenable: playerManager.currentMediaItemNotifier,
      builder: (context, value, child) {
        if (onSongInfoChange != null) {
          onSongInfoChange!.call(value);
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: titleFontSize),
              child: CurrentArtwork(
                id: value?.id ?? '',
                imageUrl: value?.artUri.toString() ?? '',
                width: artSize,
              ),
            ),
            AnimatedText(
              text: (value?.displayTitle ?? '').trim(),
              pauseAfterRound: const Duration(seconds: 2),
              showFadingOnlyWhenScrolling: false,
              fadingEdgeStartFraction: 0.1,
              fadingEdgeEndFraction: 0.1,
              startAfter: const Duration(seconds: 2),
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: titleFontSize),
            AnimatedText(
              text: (value?.displaySubtitle ?? '').trim(),
              pauseAfterRound: const Duration(seconds: 2),
              showFadingOnlyWhenScrolling: false,
              fadingEdgeStartFraction: 0.1,
              fadingEdgeEndFraction: 0.1,
              startAfter: const Duration(seconds: 2),
              style: TextStyle(
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  final double width;
  final double height;

  const AudioProgressBar({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final playerManager = GetIt.I<PlayerStateManager>();

    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: playerManager.progressNotifier,
      builder: (_, value, __) {
        return SizedBox(
          height: height,
          width: width,
          child: ProgressBar(
            progress: value.current,
            buffered: value.buffered,
            total: value.total,
            thumbRadius: 5.0,
            onSeek: playerManager.seek,
          ),
        );
      },
    );
  }
}
