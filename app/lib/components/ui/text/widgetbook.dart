import 'package:app/components/ui/seperator/ui_seperator.dart';
import 'package:app/components/ui/list/bullet_list.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';

import 'package:app/widgetbook/widgetbook_components.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: UIText,
)
Widget useCase(BuildContext context) {
  return WBPage(
    title: "Typography",
    desc: "Styles for headings, paragraphs, lists...etc",
    children: [
      showCase,
      ...hCases,
      ...bodyCases,
    ],
  );
}

final showCase = WBCase(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UIText.h1("The Joke Tax Chronicles", spaceBottom: true),
      UIText.p(
        "Once upon a time, in a far-off land, there was a very lazy king who spent all day lounging on his throne. One day, his advisors came to him with a problem: the kingdom was running out of money.",
        spaceBottom: true,
      ),
      UIText.h2("The King's Plan", spaceBottom: true),
      const UISeperator(),
      UISpace.h(UIInsets.x3),
      UIText.p(
        "The king thought long and hard, and finally came up with a brilliant plan: he would tax the jokes in the kingdom.",
        spaceBottom: true,
      ),
      UIText.h3(
        "The Joke Tax",
        spaceBottom: true,
      ),
      UIText.p(
        "The king's subjects were not amused. They grumbled and complained, but the king was firm",
        spaceBottom: true,
      ),
      UIText.lg(
        "- 1st level of puns: 5 gold coins",
        spaceBottom: true,
      ),
      UIText.lg(
        "- 2nd level of jokes: 10 gold coins",
        spaceBottom: true,
      ),
      UIText.lg(
        "- 3rd level of one-liners : 20 gold coins",
        spaceBottom: true,
      ),
      BulletList(const []),
      const UIText(
        text:
            "As a result, people stopped telling jokes, and the kingdom fell into a gloom. But there was one person who refused to let the king's foolishness get him down: a court jester named Jokester.",
        spaceBottom: true,
      ),
      UIText.h3(
        "Jokester's Revolt",
        spaceBottom: true,
      ),
      const UIText(
        text:
            "Jokester began sneaking into the castle in the middle of the night and leaving jokes all over the place: under the king's pillow, in his soup, even in the royal toilet. The king was furious, but he couldn't seem to stop Jokester.",
        spaceBottom: true,
      ),
      const UIText(
        text:
            "And then, one day, the people of the kingdom discovered that the jokes left by Jokester were so funny that they couldn't help but laugh. And once they started laughing, they couldn't stop.",
        spaceBottom: true,
      ),
    ],
  ),
);

final hCases = [
  WBCase(
      title: "H1",
      child: UIText.h1("Taxing Laughter: The Joke Tax Chronicles")),
  WBCase(title: "H2", child: UIText.h2("The People of the Kingdom")),
  WBCase(title: "H3", child: UIText.h3("The Joke Tax")),
  WBCase(title: "H4", child: UIText.h4("People stopped telling jokes")),
];

final bodyCases = [
  WBCase(
      title: "P",
      child: UIText.p(
          "The king, seeing how much happier his subjects were, realized the error of his ways and repealed the joke tax.")),
  WBCase(title: "Large", child: UIText.lg("Are you sure absolutely sure?")),
  WBCase(title: "Small", child: UIText.sm("Email address")),
];
