import 'package:flutter/material.dart';

enum ToggleVariant {
  filled,
  outline,
}

class UIToggleStyle extends ToggleStyle {
  final ToggleStyle? hoverStyle;
  final ToggleStyle? activeStyle;

  UIToggleStyle({
    super.color,
    super.decoration,
    super.padding,
    super.border,
    super.borderRadius,
    super.borderColor,
    super.textColor,
    required this.hoverStyle,
    required this.activeStyle,
  });
}

class ToggleStyle {
  final Color? color;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Border? border;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? textColor;

  ToggleStyle({
    this.color,
    this.decoration,
    this.padding,
    this.border,
    this.borderRadius,
    this.borderColor,
    this.textColor,
  });
}
