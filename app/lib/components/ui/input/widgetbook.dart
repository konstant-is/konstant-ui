import 'package:app/components/ui/input/formatters.dart';
import 'package:app/components/ui/input/ui_input.dart';
import 'package:app/components/ui/input/validators.dart';
import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIInput,
)
Widget inputUsecase(BuildContext context) {
  return WBPage(
    title: "Input",
    children: [
      const WBCase(
        title: "Default",
        maxWidth: 400,
        child: UIInput(
          placeholder: "Example",
        ),
      ),
      const WBCase(
        title: "File",
        maxWidth: 400,
        child: UIInput(
          placeholder: "Example",
        ),
      ),
      const WBCase(
        title: "Disabled",
        maxWidth: 400,
        child: UIInput(
          placeholder: "Example",
          disabled: true,
        ),
      ),
      const WBCase(
        title: "With label",
        maxWidth: 400,
        child: UIInput(
          label: "Label",
          placeholder: "Example",
        ),
      ),
      const WBCase(
        title: "Form",
        maxWidth: 400,
        child: UIInput(
          label: "Username",
          placeholder: "konstant ui",
          description: "This is your public display name.",
        ),
      ),
      WBCase(
        title: "Validation",
        maxWidth: 400,
        child: Form(
          key: GlobalKey(),
          autovalidateMode: AutovalidateMode.always,
          child: UIInput(
            label: "Email",
            placeholder: "",
            description: "This is your public display name.",
            validator: InputValidator().email().validate,
          ),
        ),
      ),
      WBCase(
        title: "Formatting",
        maxWidth: 400,
        child: Form(
          key: GlobalKey(),
          autovalidateMode: AutovalidateMode.always,
          child: UIInput(
            label: "Time",
            placeholder: "hh:mm",
            validator: InputValidator().time().validate,
            formatters: [TimeInputFormatter()],
          ),
        ),
      ),
    ],
  );
}
