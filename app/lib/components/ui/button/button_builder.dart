import 'package:app/components/ui/builders/focus_action_builder.dart';
import 'package:app/components/ui/button/button_style.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class ButtonBuilder extends StatelessWidget {
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final UIButtonStyle style;

  final bool isExpanded;

  final Widget Function(
    BuildContext context,
    FocusControlState focusControl,
    BtnStyle style,
  ) builder;

  const ButtonBuilder({
    super.key,
    required this.onTap,
    required this.builder,
    required this.style,
    this.isExpanded = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final focusBuilder = FocusActionBuilder(
      onTap: onTap,
      builder: (BuildContext context, FocusControlState control) {
        final btnStyle = getStyle(control) ?? style;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOutCirc,
          padding: style.padding ?? EdgeInsets.all(UIInsets.x1AddHalf),
          decoration: _decoration(btnStyle),
          child: builder(context, control, btnStyle),
        );
      },
    );

    return SizedBox(
      height: height,
      width: width ?? (isExpanded ? double.infinity : null),
      child: focusBuilder,
    );
  }

  BoxDecoration _decoration(BtnStyle style) => BoxDecoration(
        color: style.color,
        border: style.border ??
            Border.all(color: style.borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(
            style.shape == UIButtonShape.circular ? 100 : UIInsets.half),
      );

  BtnStyle? getStyle(FocusControlState state) {
    if (state.isActive) {
      return style.activeStyle;
    }
    if (state.isHovered) {
      return style.hoverStyle;
    }

    return style;
  }
}
