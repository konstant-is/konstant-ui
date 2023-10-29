import 'package:flutter/material.dart';
import 'package:konstant_ui/impl/components/ui/text/ui_text_style.dart';
import 'package:konstant_ui/impl/styles/ui_colors.dart';

enum UITextSize { h1, h2, h3, h4, p, small, large }

double _scale(double factor) {
  return textBaseSize * factor;
}

UITextStyle _setStyleCb(
  UITextStyle style,
  UITextStyle Function(UITextStyle style)? cb,
) {
  return cb != null ? cb(style) : style;
}

final uiTextStyle = UITextStyle(
  color: UIColors.twGray950,
  weight: FontWeight.w400,
  size: textBaseSize,
);

final h1TextStyle =
    uiTextStyle.copyWith(size: _scale(2), weight: FontWeight.w800);
final h2TextStyle =
    uiTextStyle.copyWith(size: _scale(1.75), weight: FontWeight.w600);
final h3TextStyle =
    uiTextStyle.copyWith(size: _scale(1.5), weight: FontWeight.w600);
final h4TextStyle =
    uiTextStyle.copyWith(size: _scale(1.25), weight: FontWeight.w500);

final pTextStyle = uiTextStyle;
final smallTextStyle =
    uiTextStyle.copyWith(size: _scale(0.875), weight: FontWeight.w500);
final largeTextStyle =
    uiTextStyle.copyWith(size: _scale(1.125), weight: FontWeight.w600);

typedef CustomStyle = UITextStyle Function(UITextStyle style);

class UIText extends StatelessWidget {
  final String text;
  final UITextSize size;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final UITextStyle? style;

  const UIText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.size = UITextSize.p,
  });

  static UIText h1(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      style: _setStyleCb(_style(UITextSize.h1), style),
    );
  }

  static UIText h2(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      style: _setStyleCb(_style(UITextSize.h2), style),
    );
  }

  static UIText h3(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      style: _setStyleCb(_style(UITextSize.h3), style),
    );
  }

  static UIText h4(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      style: _setStyleCb(_style(UITextSize.h4), style),
    );
  }

  static UIText p(
    String text, {
    TextAlign? textAlign,
    TextOverflow overflow = TextOverflow.ellipsis,
    final int? maxLines,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: _setStyleCb(_style(UITextSize.p), style),
    );
  }

  static UIText sm(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      style: _setStyleCb(_style(UITextSize.small), style),
    );
  }

  static UIText lg(
    String text, {
    TextAlign? textAlign,
    TextOverflow? overflow,
    CustomStyle? style,
  }) {
    return UIText(
      text: text,
      textAlign: textAlign,
      overflow: overflow,
      style: _setStyleCb(_style(UITextSize.large), style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final st = style ?? uiTextStyle;

    return Text(
      text,
      softWrap: true,
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: st.color,
        fontSize: st.size,
        fontWeight: st.weight,
        height: st.height ?? 1.2,
      ).copyWith(
        overflow: overflow,
      ),
    );
  }
}

UITextStyle _style(UITextSize size) {
  switch (size) {
    case UITextSize.h1:
      return h1TextStyle;
    case UITextSize.h2:
      return h2TextStyle;
    case UITextSize.h3:
      return h3TextStyle;
    case UITextSize.h4:
      return h4TextStyle;
    case UITextSize.p:
      return pTextStyle;
    case UITextSize.small:
      return smallTextStyle;
    case UITextSize.large:
      return largeTextStyle;
  }
}
