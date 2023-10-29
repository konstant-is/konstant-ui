import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIButton,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Button",
    desc: "Displays a button or a component that looks like a button.",
    children: [
      WBCase(
        title: "Primary",
        child: UIButton(
          onTap: () {},
          text: "Primary",
        ),
      ),
      WBCase(
        title: "Secondary",
        child: UIButton.secondary(
          onTap: () {},
          text: "Secondary",
        ),
      ),
      WBCase(
        title: "Destructive",
        child: UIButton.destructive(
          onTap: () {},
          text: "Destructive",
        ),
      ),
      WBCase(
        title: "Outline",
        child: UIButton.outline(
          onTap: () {},
          text: "Outline",
        ),
      ),
      WBCase(
        title: "Ghost",
        child: UIButton.ghost(
          onTap: () {},
          text: "Ghost",
        ),
      ),
      WBCase(
        title: "Link",
        child: UIButton.link(
          onTap: () {},
          text: "Link",
        ),
      ),
      WBCase(
        title: "Icon",
        child: UIButton.icon(onTap: () {}, icon: UIIcons.chevron()),
      ),
      WBCase(
        title: "With Icon",
        child: UIButton(
          onTap: () {},
          text: "With Icon",
          variant: BtnVariant.primary,
          leading: (st) => UIIcon(
            color: st.textColor,
            icon: UIIcons.chevronLeft,
          ),
          trailing: (st) => UIIcon(
            color: st.textColor,
            icon: UIIcons.chevronRight,
          ),
        ),
      ),
      WBCase(
        title: "Loading",
        child: UIButton(
          onTap: () {},
          text: "Loading",
          isLoading: true,
        ),
      ),
    ],
  );
}
