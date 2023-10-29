import 'package:app/components/ui/checkbox/ui_checkbox.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UICheckbox,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Checkbox",
    desc:
        "A control that allows the user to toggle between checked and not checked",
    children: [
      WBCase(
        title: "Default",
        maxWidth: 400,
        child: UICheckbox(
          value: false,
          onChange: (value) {},
          label: "Accept terms and condition",
        ),
      ),
    ],
  );
}
