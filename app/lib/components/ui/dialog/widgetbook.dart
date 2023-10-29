import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/dialog/ui_dialog.dart';
import 'package:app/components/ui/dialog/ui_dialog_builder.dart';
import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/input/ui_input.dart';
import 'package:app/styles/styles.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIDialog,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Dialog",
    desc:
        "A window overlaid on either the primary window or another dialog window, rendering the content underneath inert.",
    children: [
      WBCase(
        child: UIButton.outline(
          text: "Edit profile",
          onTap: () => const _EditProfileDialog().show(context),
        ),
      ),
      WBCase(
        title: "Custom close button",
        child: UIButton.outline(
          text: "Share",
          onTap: () => const _ShareDialog().show(context),
        ),
      )
    ],
  );
}

class _EditProfileDialog extends StatelessWidget with DialogMixin {
  const _EditProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return UIDialogBuilder(
        title: "Edit profile",
        subtitle:
            "Make changes to your profile here. Click save when you're done.",
        actions: [
          UIButton(
              text: "Save change",
              onTap: () {
                close(context);
              })
        ],
        builder: (context) => Column(
              children: [
                const UIInput(
                  label: "Name",
                  value: "Pedro Duarte",
                ),
                Space.h(UIInsets.x2),
                const UIInput(
                  label: "Username",
                  value: "@peduarte",
                )
              ],
            ));
  }

  @override
  Future<void> show(BuildContext context) {
    return UIDialog.show(context, this);
  }
}

class _ShareDialog extends StatelessWidget with DialogMixin {
  const _ShareDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return UIDialogBuilder(
      title: "Share Link",
      subtitle: "Anyone who has this link will be able to view this.",
      builder: (context) => Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: UIInput(
                  value: "https://ui.konstant.com/docs/installation",
                ),
              ),
              Space.w(UIInsets.x1),
              UIButton.icon(
                  icon: UIIcons.copy,
                  onTap: () => {},
                  variant: BtnVariant.primary),
            ],
          ),
          DialogFooter(mainAxisAlignment: MainAxisAlignment.start, children: [
            UIButton.secondary(
              text: "Close",
              onTap: () {
                close(context);
              },
            )
          ])
        ],
      ),
    );
  }

  @override
  Future<void> show(BuildContext context) {
    return UIDialog.show(context, this);
  }
}
