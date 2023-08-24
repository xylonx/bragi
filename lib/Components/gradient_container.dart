import 'package:bragi/Utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GradientContainer extends StatefulWidget {
  final Widget? child;
  final bool? opacity;
  const GradientContainer({super.key, required this.child, this.opacity});

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

class _GradientContainerState extends State<GradientContainer> {
  MyTheme currentTheme = GetIt.I<MyTheme>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: Theme.of(context).brightness == Brightness.dark
              ? ((widget.opacity == true)
                  ? currentTheme.getTransBackGradient()
                  : currentTheme.getBackGradient())
              : [
                  const Color(0xfff5f9ff),
                  Colors.white,
                ],
        ),
      ),
      child: widget.child,
    );
  }
}
