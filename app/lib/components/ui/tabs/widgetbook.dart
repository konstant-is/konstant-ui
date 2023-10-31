import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/input/ui_input.dart';
import 'package:app/components/ui/tabs/ui_tabs.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UITabs,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Tabs",
    desc:
        "A set of layered sections of content—known as tab panels—that are displayed one at a time.",
    children: [
      WBCase(
        title: "Default",
        maxWidth: 500,
        child: UITabs(
          initalValue: "account",
          tabs: [
            UITab(
              value: "account",
              text: "Account",
              child: const _TabLayout(
                title: "Account",
                message:
                    "Make changes to your account here. Click save when you're done",
                child: _Account(),
              ),
            ),
            UITab(
              value: "password",
              text: "Password",
              child: const _TabLayout(
                title: "Password",
                message:
                    "Change your password here. After saving, you'll be logged out.",
                child: _Password(),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class _TabLayout extends StatelessWidget {
  final String title;
  final String message;
  final Widget child;
  const _TabLayout(
      {required this.title, required this.child, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade200,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UIText.h4(title, spaceBottom: true),
          UIText.p(
            "Make changes to your account here. Click save when you're done.",
            style: (style) => style.copyWith(color: UIColors.twGray500),
          ),
          UISpace.h(24),
          child,
        ],
      ),
    );
  }
}

class _Account extends StatelessWidget {
  const _Account();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UIInput(
            label: "Name",
            value: "Pedro Duarte",
          ),
          UISpace.h(16),
          const UIInput(
            label: "Username",
            value: "@peduarte",
          ),
          UISpace.h(16),
          UIButton(text: "Save changes", onTap: () => {})
        ]);
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UIInput(
            label: "Current password",
            obscureText: true,
          ),
          UISpace.h(16),
          const UIInput(
            label: "New password",
            obscureText: true,
          ),
          UISpace.h(16),
          UIButton(text: "Save changes", onTap: () => {})
        ]);
  }
}
