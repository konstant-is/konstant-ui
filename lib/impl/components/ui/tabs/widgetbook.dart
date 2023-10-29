import 'package:konstant_ui/impl/components/ui/tabs/ui_tabs.dart';
import 'package:konstant_ui/impl/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UITabs,
)
Widget greenContainerUseCase(BuildContext context) {
  return WBPage(children: [
    WBCase(
      title: "Default",
      maxWidth: 500,
      child: UITabs(
        initalValue: "account",
        tabs: [
          UITab(
            value: "account",
            text: "Account",
            child: const _Box(
              title: "Account",
            ),
          ),
          UITab(
            value: "password",
            text: "Password",
            child: const _Box(
              title: "Password",
            ),
          ),
        ],
      ),
    ),
  ]);
}

class _Box extends StatelessWidget {
  final String title;
  const _Box({super.key, required this.title});

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
            Row(children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )
            ]),
            const SizedBox(height: 20),
            Container(
              height: 20,
              width: 140,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 10),
            Container(
              height: 20,
              width: 200,
              color: Colors.grey.shade200,
            ),
          ]),
    );
  }
}
