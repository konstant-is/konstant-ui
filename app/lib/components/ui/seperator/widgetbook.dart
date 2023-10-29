import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/seperator/ui_seperator.dart';

import 'package:app/components/ui/text/ui_text.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UISeperator,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Seperator",
    desc: "Visually or semantically separates content.",
    children: [
      WBCase(
        maxWidth: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.p(
              "Konstant UI",
              style: (style) => style.copyWith(weight: FontWeight.w500),
              spaceBottom: true,
            ),
            UIText.p(
              "An open-source UI component library.",
              style: (style) => style.copyWith(weight: FontWeight.w300),
            ),
            const UISeperator(),
            IntrinsicHeight(
              child: Row(
                children: [
                  UIText.p("Blog"),
                  UISeperator.vertical(),
                  UIText.p("Docs"),
                  UISeperator.vertical(),
                  UIText.p("Source")
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
