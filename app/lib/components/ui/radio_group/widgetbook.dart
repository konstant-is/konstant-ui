import 'package:app/components/ui/radio_group/radio_group.dart';
import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIRadioGroup,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Radio Group",
    desc:
        "A set of checkable buttons—known as radio buttons—where no more than one of the buttons can be checked at a time.",
    children: [
      WBCase(
        child: Center(
          child: UIRadioGroup(
            items: [
              UIRadioItem(
                label: "Default",
                value: 1,
              ),
              UIRadioItem(
                label: "Comfortable",
                value: 2,
              ),
              UIRadioItem(
                label: "Compact",
                value: 3,
              )
            ],
            onChange: (value) {
              print(value);
            },
          ),
        ),
      ),
    ],
  );
}
