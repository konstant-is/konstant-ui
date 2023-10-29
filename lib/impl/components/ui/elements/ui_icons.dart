import 'dart:math';

import 'package:konstant_ui/impl/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum UIDirection { up, left, down, right }

const _iconSize = 16.0;

Map<String, IconData> _icons = {
  "x": LucideIcons.x,
  "loader": LucideIcons.loader2,
  "settings": LucideIcons.settings,
  "alertCircle": LucideIcons.alertCircle,
  "chevronRight": LucideIcons.chevronRight,
  "plus": LucideIcons.plus,
  "chevronLeft": LucideIcons.chevronLeft,
  "arrowRight": LucideIcons.arrowRight,
  "checkCircle": LucideIcons.checkCircle2,
  "rocket": LucideIcons.rocket,
  "terminal": LucideIcons.terminal,
};

class UIIcons {
  static IconData x() => getIcon("x");
  static IconData loader() => getIcon("loader");
  static IconData settings() => getIcon("settings");
  static IconData alertCircle() => getIcon("alertCircle");
  static IconData chevronLeft() => getIcon("chevronLeft");
  static IconData chevronRight() => getIcon("chevronRight");
  static IconData plus() => getIcon("plus");
  static IconData arrowRight() => getIcon("arrowRight");
  static IconData checkCircle() => getIcon("checkCircle");
  static IconData rocket() => getIcon("rocket");
  static IconData terminal() => getIcon("terminal");

  static IconData chevron({
    UIDirection direction = UIDirection.right,
  }) {
    IconData icon = LucideIcons.chevronLeft;

    switch (direction) {
      case UIDirection.down:
        icon = LucideIcons.chevronDown;
      case UIDirection.up:
        icon = LucideIcons.chevronUp;
      case UIDirection.left:
        icon = LucideIcons.chevronLeft;
      case UIDirection.right:
        icon = LucideIcons.chevronRight;
    }
    return icon;
  }

  static IconData getIcon(String icon) {
    if (_icons.containsKey(icon)) {
      return _icons[icon]!;
    }

    throw Exception("Icon $icon not found");
  }

  static Map<String, IconData> getIconMap() => _icons;
}

class UIIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  final UIAnimation? animation;

  const UIIcon({
    super.key,
    required this.icon,
    this.color = UIColors.twGray950,
    this.size = _iconSize,
    this.animation,
  });

  @override
  Widget build(BuildContext context) {
    if (animation != null) {
      return UIAnimationBuilder(
        animation: animation!.animation,
        duration: animation!.duration,
        child: body(),
      );
    }
    return body();
  }

  Widget body() {
    return Icon(
      icon,
      size: size ?? _iconSize,
      color: color,
    );
  }
}

enum UIAnim { spin, pulse }

class UIAnimation {
  final UIAnim animation;
  final Duration duration;

  UIAnimation({required this.animation, required this.duration});
}

class UIAnimationBuilder extends StatefulWidget {
  final Duration duration;
  final UIAnim? animation;
  final Widget child;

  const UIAnimationBuilder({
    super.key,
    required this.child,
    required this.animation,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<UIAnimationBuilder> createState() => _UIAnimationBuilderState();
}

class _UIAnimationBuilderState extends State<UIAnimationBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        switch (widget.animation) {
          case UIAnim.spin:
            return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: child,
            );
          case UIAnim.pulse:
            return Transform.scale(
              scale: _controller.value,
              child: child,
            );
          default:
            return child ?? widget.child;
        }
      },
      child: widget.child,
    );
  }
}
