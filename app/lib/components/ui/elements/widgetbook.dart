import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/elements/ui_spinner.dart';
import 'package:app/styles/styles.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIIcon,
)
Widget iconCase(BuildContext context) {
  final iconMap = UIIcons.getIconMap();

  Color? getColor(int index) {
    if (index == 0) return UIColors.twAmber500;
    if (index == 1) return UIColors.twBlue400;
    if (index == 2) return UIColors.twYellow600;
    if (index == 3) return UIColors.twViolet600;
    if (index == 4) return UIColors.twGreen500;
    if (index == 5) return UIColors.twCyan600;
    return null;
  }

  Widget iconBox(MapEntry<String, IconData> entry,
          {Color? color, double? size}) =>
      Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        width: 100,
        child: Column(
          children: [
            UIIcon(
              icon: entry.value,
              size: size,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              entry.key,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      );

  return WBPage(
    title: "Icons",
    children: [
      WBCase(
        title: "Icons",
        child: Wrap(
          children: iconMap.entries.map(iconBox).toList(),
        ),
      ),
      WBCase(
        title: "Color",
        child: Wrap(
          children: iconMap.entries
              .take(5)
              .mapIndexed((index, e) => iconBox(e, color: getColor(index)))
              .toList(),
        ),
      ),
      WBCase(
        title: "Size",
        child: Wrap(
          children: iconMap.entries
              .take(3)
              .mapIndexed((index, e) => iconBox(e, size: 16.0 * (index + 1)))
              .toList(),
        ),
      ),
      WBCase(
        title: "Spin",
        child: UIIcon(
            icon: UIIcons.loader,
            animation: UIAnimation(
              animation: UIAnim.spin,
              duration: const Duration(milliseconds: 1500),
            )),
      ),
    ],
  );
}

@widgetbook.UseCase(
  name: 'default',
  type: UISpinner,
)
Widget spinnerCase(BuildContext context) {
  return const WBPage(
    title: "Spinner",
    children: [
      WBCase(title: "Default", child: UISpinner()),
    ],
  );
}
