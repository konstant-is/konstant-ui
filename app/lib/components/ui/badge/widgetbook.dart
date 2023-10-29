import 'package:app/components/ui/badge/ui_badge.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIBadge,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Badge",
    desc: "Displays a badge or a component that looks like a badge.",
    children: [
      const WBCase(
          title: "Default",
          child: UIBadge(
            text: "Badge",
          )),
      WBCase(
          title: "Secondary",
          child: UIBadge.secondary(
            text: "Secondary",
          )),
      WBCase(
          title: "Outline",
          child: UIBadge.outline(
            text: "Outline",
          )),
      WBCase(
          title: "Destructive",
          child: UIBadge.destructive(
            text: "Destructive",
          )),
    ],
  );
}
