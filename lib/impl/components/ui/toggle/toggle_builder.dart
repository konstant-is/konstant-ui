import 'package:konstant_ui/impl/components/ui/builders/focus_action_builder.dart';
import 'package:konstant_ui/impl/components/ui/toggle/toggle_style.dart';
import 'package:konstant_ui/impl/styles/styles.dart';
import 'package:flutter/material.dart';

class ToggleBuilder extends StatelessWidget {
  final VoidCallback onTap;
  final bool isToggled;
  final double? width;
  final double? height;
  final UIToggleStyle style;

  final bool isExpanded;

  final Widget Function(
    BuildContext context,
    FocusControlState focusControl,
    ToggleStyle style,
  ) builder;

  const ToggleBuilder({
    super.key,
    required this.onTap,
    required this.isToggled,
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
        final toggleStyle = getStyle(control) ?? style;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOutCirc,
          padding: style.padding ?? EdgeInsets.all(UIInsets.base),
          decoration: _decoration(toggleStyle),
          child: builder(context, control, toggleStyle),
        );
      },
    );

    return SizedBox(
      height: height,
      width: width ?? (isExpanded ? double.infinity : null),
      child: focusBuilder,
    );
  }

  BoxDecoration _decoration(ToggleStyle style) => BoxDecoration(
        color: style.color,
        border: style.border ??
            Border.all(color: style.borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(UIInsets.half),
      );

  ToggleStyle? getStyle(FocusControlState state) {
    if (isToggled || state.isActive) {
      return style.activeStyle;
    }
    if (state.isHovered) {
      return style.hoverStyle;
    }

    return style;
  }
}
