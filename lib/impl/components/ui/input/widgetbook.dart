import 'package:konstant_ui/impl/components/ui/input/formatters.dart';
import 'package:konstant_ui/impl/components/ui/input/ui_input.dart';
import 'package:konstant_ui/impl/components/ui/input/validators.dart';
import 'package:konstant_ui/impl/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIInput,
)
Widget greenContainerUseCase(BuildContext context) {
  return WBPage(
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
