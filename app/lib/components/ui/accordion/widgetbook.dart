import 'package:app/components/ui/accordion/ui_accordion.dart';
import 'package:app/components/ui/text/ui_text.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';

import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIAccordion,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Accordion",
    desc:
        "A vertically stacked set of interactive headings that each reveal a section of content.",
    children: [
      WBCase(
        title: "Default",
        maxWidth: 400,
        child: UIAccordion(
          items: [
            UIAccordionItem(
              label: "Is it accessible?",
              content:
                  UIText.p("Yes. It adheres to the WAI-ARIA design pattern."),
            ),
            UIAccordionItem(
              label: "Is it styled?",
              content: UIText.p(
                  "Yes. It comes with default styles that matches the other components' aesthetic."),
            ),
            UIAccordionItem(
              label: "Is it animated?",
              content: UIText.p(
                  "Yes. It's animated by default, but you can disable it if you prefer."),
            )
          ],
        ),
      ),
    ],
  );
}
