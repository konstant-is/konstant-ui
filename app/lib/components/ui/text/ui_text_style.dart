import 'package:flutter/material.dart';
import 'package:app/styles/ui_colors.dart';

const _colorText = UIColors.twGray700;
const _colorStrong = UIColors.twGray800;
const _colorWeak = UIColors.twGray500;

const textBaseSize = 14.0;

class UITextStyle {
  final Color? color;
  final FontWeight? weight;
  final double size;
  final double? height;
  final TextStyle? style;

  UITextStyle({
    this.color = _colorText,
    this.weight,
    this.style,
    this.size = textBaseSize,
    this.height,
  });

  UITextStyle copyWith({
    Color? color,
    FontWeight? weight,
    TextStyle? style,
    double? size,
    double? height,
  }) {
    return UITextStyle(
      color: color ?? this.color,
      weight: weight ?? this.weight,
      size: size ?? this.size,
      height: height ?? this.height,
      style: style ?? this.style,
    );
  }

  TextStyle getTextStyle() => TextStyle(
        fontWeight: weight,
        color: color,
        fontSize: size,
        height: height ?? 1.2,
      );

  UITextStyle strong({Color? color}) => copyWith(color: _colorStrong);
  UITextStyle weak({Color? color}) => copyWith(color: _colorWeak);
}
