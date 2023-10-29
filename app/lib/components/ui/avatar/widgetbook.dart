import 'package:app/components/ui/avatar/ui_avatar.dart';
import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/seperator/ui_seperator.dart';

import 'package:app/components/ui/text/ui_text.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIAvatar,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Avatar",
    desc: "An image element with a fallback for representing the user.",
    children: [
      WBCase(
        maxWidth: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIAvatar(
              image: const AssetImage("assets/avatar.png"),
              onTap: () {},
              child: UIText.p("PP"),
            )
          ],
        ),
      )
    ],
  );
}
