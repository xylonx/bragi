import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:bragi/Utils/snackbar.dart';
import 'package:flutter/material.dart';

class SeekBar extends StatefulWidget {
  final AudioHandler audioHandler;

  final Duration duration;
  final Duration position;
  final Duration bufferedPosition;

  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;

  const SeekBar({
    super.key,
    required this.audioHandler,
    required this.duration,
    required this.position,
    this.bufferedPosition = Duration.zero,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double? _dragValue;
  bool _dragging = false;
  late SliderThemeData _sliderThemeData;

  Duration get _duration => widget.duration;
  Duration get _position => widget.position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _sliderThemeData = SliderTheme.of(context).copyWith(trackHeight: 4);
  }

  @override
  Widget build(BuildContext context) {
    final value = min(
      _dragValue ?? widget.position.inMilliseconds.toDouble(),
      widget.duration.inMilliseconds.toDouble(),
    );
    if (_dragValue != null && !_dragging) {
      _dragValue = null;
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                GestureDetector(
                  child: Text(
                    '1.0x',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  onTap: () {
                    Snackbar.show(
                      context,
                      'control speed is not supported now',
                    );
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: SliderTheme(
                          data: _sliderThemeData.copyWith(
                            // thumbShape: HiddenThumbComponentShape(),
                            overlayShape: SliderComponentShape.noThumb,
                            activeTrackColor: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.5),
                            inactiveTrackColor: Theme.of(context)
                                .iconTheme
                                .color!
                                .withOpacity(0.3),
                            trackShape: const RectangularSliderTrackShape(),
                          ),
                          child: ExcludeSemantics(
                            child: Slider(
                              max: widget.duration.inMilliseconds.toDouble(),
                              value: min(
                                widget.bufferedPosition.inMilliseconds
                                    .toDouble(),
                                widget.duration.inMilliseconds.toDouble(),
                              ),
                              onChanged: (v) {},
                            ),
                          ),
                        ),
                      ),
                      SliderTheme(
                        data: _sliderThemeData.copyWith(
                          inactiveTrackColor: Colors.transparent,
                          activeTrackColor: Theme.of(context).iconTheme.color,
                          thumbColor: Theme.of(context).iconTheme.color,
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8.0,
                          ),
                          overlayShape: SliderComponentShape.noThumb,
                        ),
                        child: Slider(
                          max: widget.duration.inMilliseconds.toDouble(),
                          value: value,
                          onChanged: (value) {
                            if (!_dragging) {
                              _dragging = true;
                            }
                            setState(() {
                              _dragValue = value;
                            });
                            widget.onChanged
                                ?.call(Duration(milliseconds: value.round()));
                          },
                          onChangeEnd: (value) {
                            widget.onChangeEnd
                                ?.call(Duration(milliseconds: value.round()));
                            _dragging = false;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                .firstMatch('$_position')
                                ?.group(1) ??
                            '$_position',
                      ),
                      Text(
                        RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$')
                                .firstMatch('$_duration')
                                ?.group(1) ??
                            '$_duration',
                        // style: Theme.of(context).textTheme.caption!.copyWith(
                        //       color: Theme.of(context).iconTheme.color,
                        //     ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
