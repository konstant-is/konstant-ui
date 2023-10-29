import 'package:app/components/ui/builders/focus_action_builder.dart';
import 'package:app/components/ui/text/ui_text_style.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class BoxBuilder extends StatelessWidget {
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final UIBoxStyle style;
  final bool? isToggled;
  final bool isExpanded;
  final bool isDisabled;

  final bool? customChild;

  final Widget Function(
    BuildContext context,
    FocusControlState focusControl,
    BoxStyle style,
  ) builder;

  const BoxBuilder({
    super.key,
    this.onTap,
    required this.style,
    required this.builder,
    this.isExpanded = false,
    this.width,
    this.height,
    this.isToggled,
    this.customChild,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final focusBuilder = FocusActionBuilder(
      onTap: onTap,
      cursor: isDisabled ? SystemMouseCursors.forbidden : null,
      builder: (BuildContext context, FocusControlState control) {
        final boxStyle = getStyle(control) ?? style;

        if (customChild != null) {
          return builder(
            context,
            control,
            boxStyle,
          );
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          curve: Curves.easeOutCirc,
          padding: style.padding ?? EdgeInsets.all(UIInsets.x1),
          decoration: boxStyle.getDecoration(),
          child: builder(
            context,
            control,
            boxStyle,
          ),
        );
      },
    );

    return SizedBox(
      height: height,
      width: width ?? (isExpanded ? double.infinity : null),
      child: focusBuilder,
    );
  }

  BoxStyle? getStyle(FocusControlState state) {
    if (state.isActive || isToggled == true) {
      return style.activeStyle;
    }
    if (state.isHovered) {
      return style.hoverStyle;
    }

    return style;
  }
}

class UIBoxStyle extends BoxStyle {
  late BoxStyle hoverStyle;
  late BoxStyle activeStyle;

  UIBoxStyle({
    BoxStyle? hoverStyle,
    BoxStyle? activeStyle,
    super.color,
    super.decoration,
    super.padding,
    super.border,
    super.borderRadius,
    super.borderColor,
    super.textColor,
    super.textWeight,
  }) {
    this.hoverStyle = _setStateStyle(hoverStyle);
    this.activeStyle = _setStateStyle(activeStyle);
  }

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

  BoxStyle _setStateStyle(BoxStyle? style) => BoxStyle(
        color: style?.color ?? color,
        decoration: style?.decoration ?? decoration,
        padding: style?.padding ?? padding,
        border: style?.border ?? border,
        borderRadius: style?.borderRadius ?? borderRadius,
        borderColor: style?.borderColor ?? borderColor,
        textColor: style?.textColor ?? textColor,
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
  final FontWeight? textWeight;

  BoxStyle({
    this.color,
    this.decoration,
    this.padding,
    this.border,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.textWeight,
  });

  BoxDecoration getDecoration() =>
      decoration?.copyWith(color: color) ??
      BoxDecoration(
        color: color,
        border: border ?? Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: borderRadius ?? BorderRadius.circular(UIInsets.half),
      );

  UITextStyle getTextStyle() => UITextStyle(
        color: textColor,
        weight: textWeight,
      );
}
