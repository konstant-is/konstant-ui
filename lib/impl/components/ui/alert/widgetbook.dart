import 'package:konstant_ui/impl/components/ui/alert/ui_alert.dart';
import 'package:konstant_ui/impl/components/ui/elements/ui_icons.dart';
import 'package:konstant_ui/impl/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIAlert,
)
Widget useCase(BuildContext context) {
  return WBPage(
    children: [
      WBCase(
        title: "Default",
        child: UIAlert(
          title: "Heads up!",
          message: "You can add components to your app using the cli.",
          icon: UIIcon(icon: UIIcons.terminal()),
        ),
      ),
    ],
  );
}
