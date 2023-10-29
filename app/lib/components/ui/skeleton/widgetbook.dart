import 'package:app/components/ui/skeleton/ui_skeleton.dart';

import 'package:app/styles/styles.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: Skeleton,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Skeleton",
    desc: "Use to show a placeholder while content is loading.",
    children: [
      WBCase(
        maxWidth: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Skeleton.circle(size: 40),
            Space.w(UIInsets.x1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Skeleton(width: 200),
                Space.h(8),
                const Skeleton(width: 150),
              ],
            )
          ],
        ),
      ),
    ],
  );
}
