import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/text/ui_text.dart';

import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class UIAlertStyle extends BoxStyle {
  UIAlertStyle({
    super.color,
    super.decoration,
    super.padding,
    super.border,
    super.borderRadius,
    super.borderColor,
    super.textColor,
  });
}

final alertStyle = UIAlertStyle(
  padding: EdgeInsets.symmetric(
    horizontal: UIInsets.x2,
    vertical: UIInsets.x2,
  ),
  borderColor: UIColors.twGray200,
  borderRadius: BorderRadius.circular(UIInsets.x1),
);

class UIAlert extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? message;
  final Widget? child;

  final UIAlertStyle? style;

  const UIAlert({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.child,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final st = style ?? alertStyle;
    return Container(
        padding: st.padding,
        decoration: st.getDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              icon!,
              Space.w(UIInsets.x2),
            ],
            Expanded(child: body()),
          ],
        ));
  }

  Widget body() {
    if (child != null) return child!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null) ...[UIText.lg(title!), Space.h(UIInsets.x1)],
        if (message != null) ...[UIText.p(message!)]
      ],
    );
  }
}
