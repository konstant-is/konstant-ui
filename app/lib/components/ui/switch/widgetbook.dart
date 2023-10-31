import 'package:app/components/ui/button/ui_button.dart';

import 'package:app/components/ui/switch/ui_switch.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UISwitch,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Switch",
    desc:
        "A control that allows the user to toggle between checked and not checked.",
    children: [
      WBCase(
        child: Center(
          child: UISwitch(
            label: "Airplane Mode",
            value: false,
            onChange: (bool value) {
              print(value);
            },
          ),
        ),
      ),
      WBCase(
        title: "Form",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FormBox(
                title: "Marketing emails",
                text: "Receive emails about new products, features, and more.",
                child: UISwitch(
                  value: false,
                  onChange: (val) => {},
                )),
            UISpace.h(16),
            _FormBox(
              title: "Security emails",
              text: "Receive emails about your account security.",
              child: UISwitch(
                value: true,
                isDisabled: true,
                onChange: (val) => {},
              ),
            ),
            UISpace.h(16),
            UIButton.primary(text: "Submit", onTap: () => {})
          ],
        ),
      ),
    ],
  );
}

class _FormBox extends StatelessWidget {
  final String title;
  final String text;
  final Widget child;

  const _FormBox(
      {super.key,
      required this.title,
      required this.text,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        padding: pa(UIInsets.x2),
        decoration: BoxDecoration(
            border: Border.all(
              color: UIColors.twGray300,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText.lg(title, spaceBottom: true),
                  UIText.p(
                    text,
                    style: (style) => style.copyWith(
                      weight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ),
            UISpace.w(UIInsets.x3),
            child,
          ],
        ));
  }
}
