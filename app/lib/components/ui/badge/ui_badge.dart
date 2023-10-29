import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/ui_colors.dart';
import 'package:app/styles/ui_insets.dart';
import 'package:flutter/material.dart';

final _style = UIBoxStyle(
  padding: EdgeInsets.symmetric(
    horizontal: UIInsets.x1,
    vertical: UIInsets.half,
  ),
  borderRadius: BorderRadius.circular(UIInsets.x4),
);
final _badgeStyle = _style.copyWith(
  color: UIColors.twBlue700,
  textColor: UIColors.white,
);

final _secondaryStyle = _style.copyWith(
  color: UIColors.twGray200,
  textColor: UIColors.twGray950,
);

final _outlineyStyle = _style.copyWith(
  textColor: UIColors.twGray900,
  border: Border.all(color: UIColors.twGray300),
);

final _destructiveStyle = _style.copyWith(
  color: UIColors.twRed500,
  textColor: UIColors.white,
);

class UIBadge extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final UIBoxStyle? style;

  const UIBadge({super.key, required this.text, this.style, this.onTap});

  factory UIBadge.primary({required String text}) {
    return UIBadge(
      text: text,
      style: _badgeStyle,
    );
  }

  factory UIBadge.secondary({required String text}) {
    return UIBadge(
      text: text,
      style: _secondaryStyle,
    );
  }

  factory UIBadge.outline({required String text}) {
    return UIBadge(
      text: text,
      style: _outlineyStyle,
    );
  }

  factory UIBadge.destructive({required String text}) {
    return UIBadge(
      text: text,
      style: _destructiveStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BoxBuilder(
      onTap: onTap,
      style: style ?? _badgeStyle,
      builder: (context, state, style) {
        return UIText.sm(
          text,
          style: (textStyle) => textStyle.copyWith(color: style.textColor),
        );
      },
    );
  }
}
