import 'dart:async';

import 'package:app/styles/ui_colors.dart';
import 'package:flutter/material.dart';

final _decoration = BoxDecoration(
  color: UIColors.twGray100,
  borderRadius: BorderRadius.circular(4),
);

class MinMaxFactor {
  double max;
  final double min;

  MinMaxFactor({this.max = 1, required this.min}) {
    // Ensure that max is not less than min, fall back to a safe value if needed.
    if (max < min) {
      max = min;
    }
  }
}

class Skeleton extends StatelessWidget {
  final double height;
  final double width;
  final bool expanded;
  final Color color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;

  const Skeleton({
    super.key,
    this.height = 14,
    this.width = 100,
    this.color = UIColors.twGray100,
    this.margin,
    this.padding,
    this.decoration,
    this.expanded = false,
  });

  static Widget circle({
    Color? color,
    double size = 50,
  }) =>
      SizedBox(
        width: size,
        height: size,
        child: Skeleton(
          width: size,
          height: size,
          decoration: _decoration.copyWith(
            color: color,
            borderRadius: BorderRadius.circular(size * 2),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return _SkeletonBuilder(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: decoration,
        expanded: expanded,
        color: color,
      );
    });
  }
}

class _SkeletonBuilder extends StatefulWidget {
  final double height;
  final double width;

  final bool expanded;
  final Color color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;

  const _SkeletonBuilder({
    required this.height,
    required this.width,
    required this.expanded,
    required this.color,
    this.margin,
    this.padding,
    this.decoration,
  });

  @override
  State<_SkeletonBuilder> createState() => _SkeletonBuilderState();
}

class _SkeletonBuilderState extends State<_SkeletonBuilder> {
  late double _width;
  late Timer _timer;
  double _opacity = 1;
  final _duration = const Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    _width = widget.width;
    _timer = Timer.periodic(_duration, (timer) {
      setState(() {
        _opacity = _opacity == 1 ? 0.3 : 1;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: _duration,
      child: Container(
        decoration: widget.decoration ?? _decoration,
        margin: widget.margin,
        padding: widget.padding,
        height: widget.height,
        width: _width,
      ),
    );
  }
}
