import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/dialog/ui_dialog.dart';
import 'package:app/components/ui/dialog/ui_dialog_builder.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class UIAlertDialog extends StatelessWidget with DialogMixin {
  final String title;
  final String message;
  final Function(BuildContext context) onActionTap;

  const UIAlertDialog(
      {super.key,
      required this.title,
      required this.message,
      required this.onActionTap});

  @override
  Future<void> show(BuildContext context) {
    return UIDialog.show(context, this);
  }

  @override
  Widget build(BuildContext context) {
    return UIDialogBuilder(
      title: title,
      actions: [
        UIButton.ghost(
            text: "Close",
            onTap: () {
              close(context);
            }),
        Space.w(UIInsets.x1),
        UIButton(
            text: "Continue",
            onTap: () {
              onActionTap(context);
            })
      ],
      builder: (context) => UIText.p(message),
    );
  }
}
