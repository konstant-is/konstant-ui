import 'package:app/components/ui/alert_dialog.dart/ui_alert_dialog.dart';
import 'package:app/components/ui/button/ui_button.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIAlertDialog,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Alert dialog",
    desc:
        "A modal dialog that interrupts the user with important content and expects a response",
    children: [
      WBCase(
          child: UIButton.outline(
        onTap: () => UIAlertDialog(
          onActionTap: (context) {
            Navigator.of(context).pop();
          },
          title: "Are you absolutely sure?",
          message:
              "This action cannot be undone. This will permanently delete your account and remove your data from our servers",
        ).show(context),
        text: "Show dialog",
      )),
    ],
  );
}
