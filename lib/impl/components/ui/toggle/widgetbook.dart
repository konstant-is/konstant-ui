import 'package:konstant_ui/impl/components/ui/elements/ui_icons.dart';
import 'package:konstant_ui/impl/components/ui/toggle/ui_toggle.dart';
import 'package:konstant_ui/impl/components/ui/toggle/ui_toggle_button.dart';
import 'package:konstant_ui/impl/components/ui/toggle/ui_toggle_list.dart';
import 'package:konstant_ui/impl/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIToggleButton,
)
Widget greenContainerUseCase(BuildContext context) {
  return WBPage(children: [
    WBCase(
      title: "Filled",
      child: UIToggleButton.filled(
        name: "filled",
        text: 'Toggle',
      ),
    ),
    WBCase(
      title: "Outlined",
      child: UIToggleButton.outline(
        name: "outline",
        text: 'Toggle',
      ),
    ),
    WBCase(
      title: "Icon",
      child: UIToggleButton.icon(
        name: "icon",
        icon: UIIcons.rocket(),
      ),
    ),
    WBCase(
      title: "With icon",
      child: UIToggleButton.filled(
        name: "icon",
        text: "Toggle",
        leading: (style) =>
            UIIcon(icon: UIIcons.chevron(direction: UIDirection.left)),
        trailing: (style) =>
            UIIcon(icon: UIIcons.chevron(direction: UIDirection.right)),
      ),
    ),
    WBCase(
      title: "Multiple",
      child: UIToggleList(
        onChange: (val) {
          print(val);
        },
        items: [
          UIToggle.icon(
            name: "rocket",
            icon: UIIcons.rocket(),
          ),
          UIToggle.icon(
            name: "plus",
            icon: UIIcons.plus(),
          ),
          UIToggle.icon(
            name: "x",
            icon: UIIcons.x(),
          ),
        ],
      ),
    ),
    WBCase(
      title: "Multiple with max select",
      child: UIToggleList(
        maxSelectable: 2,
        onChange: (val) {
          print(val);
        },
        items: [
          UIToggle.icon(
            value: true,
            name: "rocket",
            icon: UIIcons.rocket(),
          ),
          UIToggle.icon(
            value: true,
            name: "plus",
            icon: UIIcons.plus(),
          ),
          UIToggle.icon(
            name: "x",
            icon: UIIcons.x(),
          ),
        ],
      ),
    ),
  ]);
}
