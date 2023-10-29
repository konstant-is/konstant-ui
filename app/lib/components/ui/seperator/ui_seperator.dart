import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

enum UIOrientation { horizontal, vertical }

class UISeperator extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsets? margin;
  final UIOrientation orientation;

  static Widget vertical({
    final double? height,
    final double? width,
    final Color? color,
    final EdgeInsets? margin,
  }) {
    return UISeperator(
      orientation: UIOrientation.vertical,
      height: height,
      color: color,
      width: width,
      margin: margin,
    );
  }

  const UISeperator({
    super.key,
    this.height,
    this.color,
    this.width,
    this.margin,
    this.orientation = UIOrientation.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case UIOrientation.horizontal:
        return Container(
          margin: margin ?? py(UIInsets.x2),
          width: width ?? double.infinity,
          height: height ?? 1,
          color: color ?? UIColors.twGray300,
        );
      case UIOrientation.vertical:
        return Container(
          margin: margin ?? px(UIInsets.x2),
          width: 1,
          height: height ?? double.infinity,
          color: color ?? UIColors.twGray300,
        );
    }
  }
}
