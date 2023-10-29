import 'package:konstant_ui/impl/components/ui/builders/focus_action_builder.dart';
import 'package:konstant_ui/impl/styles/styles.dart';
import 'package:flutter/material.dart';

class BoxBuilder extends StatelessWidget {
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final UIBoxStyle style;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  final bool isExpanded;

  final Widget Function(
    BuildContext context,
    FocusControlState focusControl,
    BoxStyle style,
  ) builder;

  const BoxBuilder({
    super.key,
    required this.onTap,
    required this.builder,
    required this.style,
    this.isExpanded = false,
    this.width,
    this.height,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final focusBuilder = FocusActionBuilder(
      onTap: onTap,
      builder: (BuildContext context, FocusControlState control) {
        final boxStyle = getStyle(control) ?? style;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOutCirc,
          padding: style.padding ?? EdgeInsets.all(UIInsets.base),
          decoration: _decoration(boxStyle),
          child: builder(context, control, boxStyle),
        );
      },
    );

    return SizedBox(
      height: height,
      width: width ?? (isExpanded ? double.infinity : null),
      child: focusBuilder,
    );
  }

  BoxDecoration _decoration(BoxStyle style) => BoxDecoration(
        color: color ?? style.color,
        border: style.border ??
            Border.all(color: style.borderColor ?? Colors.transparent),
        borderRadius: borderRadius,
      );

  BoxStyle? getStyle(FocusControlState state) {
    if (state.isActive) {
      return style.activeStyle;
    }
    if (state.isHovered) {
      return style.hoverStyle;
    }

    return style;
  }
}

class UIBoxStyle extends BoxStyle {
  final BoxStyle? hoverStyle;
  final BoxStyle? activeStyle;

  UIBoxStyle(
      {super.color,
      super.decoration,
      super.padding,
      super.border,
      super.borderRadius,
      super.borderColor,
      super.textColor,
      required this.hoverStyle,
      required this.activeStyle});

  UIBoxStyle copyWith({
    Color? color,
    EdgeInsets? padding,
    BoxDecoration? decoration,
    Border? border,
    BorderRadius? borderRadius,
    Color? borderColor,
    Color? textColor,
    BoxStyle? hoverStyle,
    BoxStyle? activeStyle,
  }) =>
      UIBoxStyle(
        color: color ?? this.color,
        decoration: decoration ?? this.decoration,
        padding: padding ?? this.padding,
        border: border ?? this.border,
        borderRadius: borderRadius ?? this.borderRadius,
        borderColor: borderColor ?? this.borderColor,
        textColor: textColor ?? this.textColor,
        hoverStyle: hoverStyle ?? this.hoverStyle,
        activeStyle: activeStyle ?? this.activeStyle,
      );
}

class BoxStyle {
  final Color? color;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Border? border;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Color? textColor;

  BoxStyle({
    this.color,
    this.decoration,
    this.padding,
    this.border,
    this.borderRadius,
    this.borderColor,
    this.textColor,
  });

  BoxDecoration getDecoration() => BoxDecoration(
        color: color,
        border: border ?? Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(UIInsets.half),
      );
}
