import 'package:flutter/material.dart';

enum UIButtonShape { rounded, circular }

enum UIButtonType { normal, icon }

class UIButtonStyle extends BtnStyle {
  final BtnStyle? hoverStyle;
  final BtnStyle? activeStyle;

  UIButtonStyle({
    this.hoverStyle,
    this.activeStyle,
    Color? color,
    EdgeInsets? padding,
    BoxDecoration? decoration,
    Border? border,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? textColor,
    UIButtonShape? shape = UIButtonShape.rounded,
  }) : super(
          color: color,
          padding: padding,
          decoration: decoration,
          border: border,
          borderRadius: borderRadius,
          borderColor: borderColor,
          textColor: textColor,
          shape: shape,
        );

  UIButtonStyle copyWith({
    Color? color,
    EdgeInsets? padding,
    BoxDecoration? decoration,
    Border? border,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? textColor,
    BtnStyle? hoverStyle,
    BtnStyle? activeStyle,
  }) =>
      UIButtonStyle(
        color: color ?? this.color,
        decoration: decoration ?? this.decoration,
        padding: padding ?? this.padding,
        border: border ?? this.border,
        borderRadius: borderRadius ?? this.borderRadius,
        borderColor: borderColor ?? this.borderColor,
        textColor: textColor ?? this.textColor,
        hoverStyle: hoverStyle ?? this.hoverStyle,
        activeStyle: activeStyle ?? this.activeStyle,
      );
}

class BtnStyle {
  final Color? color;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Border? border;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? textColor;
  final UIButtonShape? shape;

  BtnStyle({
    this.color,
    this.decoration,
    this.padding,
    this.border,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.shape = UIButtonShape.rounded,
  });
}

class BtnStyleState {
  final UIButtonStyle idle;
  final UIButtonStyle hover;
  final UIButtonStyle active;

  BtnStyleState(
      {required this.idle, required this.hover, required this.active});
}
