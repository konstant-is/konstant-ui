import 'package:konstant_ui/impl/components/ui/elements/ui_icons.dart';
import 'package:konstant_ui/impl/components/ui/text/ui_text.dart';
import 'package:konstant_ui/impl/components/ui/toggle/toggle_builder.dart';
import 'package:konstant_ui/impl/components/ui/toggle/toggle_style.dart';
import 'package:konstant_ui/impl/styles/styles.dart';
import 'package:flutter/material.dart';

final toggleFilledStyle = UIToggleStyle(
    textColor: UIColors.twGray950,
    hoverStyle: ToggleStyle(
      color: UIColors.twGray100,
      textColor: UIColors.twGray950,
    ),
    activeStyle: ToggleStyle(
      color: UIColors.twGray200,
      textColor: UIColors.twGray950,
    ));

final toggleOutlinedStyle = UIToggleStyle(
    color: Colors.transparent,
    textColor: UIColors.twGray950,
    border: Border.all(color: UIColors.twGray300),
    hoverStyle: ToggleStyle(
      color: UIColors.twGray100,
      textColor: UIColors.twGray950,
      border: Border.all(color: UIColors.twGray300),
    ),
    activeStyle: ToggleStyle(
      color: UIColors.twGray200,
      textColor: UIColors.twGray950,
      border: Border.all(color: UIColors.twGray300),
    ));

class UIToggle extends StatelessWidget {
  final String name;
  final bool value;
  final void Function(bool toggled)? onTap;
  final String? text;
  final Widget? child;
  final ToggleVariant variant;
  final UIToggleStyle? style;
  final Widget Function(ToggleStyle style)? leading;
  final Widget Function(ToggleStyle style)? trailing;

  const UIToggle({
    super.key,
    required this.name,
    required this.variant,
    required this.onTap,
    this.value = false,
    this.text,
    this.style,
    this.leading,
    this.trailing,
    this.child,
  });

  factory UIToggle.outline({
    required String name,
    void Function(bool toggled)? onTap,
    String? text,
    bool value = false,
    Widget? child,
    UIToggleStyle? style,
    Widget Function(ToggleStyle style)? leading,
    Widget Function(ToggleStyle style)? trailing,
  }) {
    return UIToggle(
      name: name,
      value: value,
      variant: ToggleVariant.outline,
      text: text,
      style: style,
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      child: child,
    );
  }

  factory UIToggle.filled({
    required String name,
    String? text,
    bool value = false,
    Widget? child,
    UIToggleStyle? style,
    void Function(bool toggled)? onTap,
    Widget Function(ToggleStyle style)? leading,
    Widget Function(ToggleStyle style)? trailing,
  }) {
    return UIToggle(
      name: name,
      variant: ToggleVariant.filled,
      value: value,
      text: text,
      style: style,
      onTap: onTap,
      leading: leading,
      trailing: trailing,
      child: child,
    );
  }

  factory UIToggle.icon({
    required String name,
    required IconData icon,
    bool value = false,
    UIToggleStyle? style,
    ToggleVariant? variant,
    void Function(bool toggled)? onTap,
  }) =>
      UIToggle(
        name: name,
        value: value,
        onTap: onTap,
        style: style,
        variant: variant ?? ToggleVariant.filled,
        child: UIIcon(icon: icon),
      );

  UIToggle copyWith({
    String? text,
    bool? value,
    Widget? child,
    UIToggleStyle? style,
    void Function(bool toggled)? onTap,
    Widget Function(ToggleStyle style)? leading,
    Widget Function(ToggleStyle style)? trailing,
  }) {
    return UIToggle(
      name: name,
      variant: variant,
      text: text ?? this.text,
      value: value ?? this.value,
      style: style ?? this.style,
      onTap: onTap ?? this.onTap,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
      child: child ?? this.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ToggleBuilder(
      isToggled: value,
      onTap: () => onTap?.call(!value),
      style: style ?? _variant(variant),
      builder: (context, focusControl, style) => container(context, style),
    );
  }

  Widget container(BuildContext context, ToggleStyle style) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (leading != null) ...[leading!(style), Space.w(UIInsets.base)],
        child ?? const SizedBox(),
        text == null
            ? const SizedBox()
            : UIText.p(
                text!,
                textAlign: TextAlign.center,
                style: (st) => st.copyWith(
                  weight: FontWeight.w500,
                ),
              ),
        if (trailing != null) ...[
          Space.w(UIInsets.base),
          trailing!(style),
        ],
      ],
    );
  }
}

UIToggleStyle _variant(ToggleVariant variant) {
  switch (variant) {
    case ToggleVariant.filled:
      return toggleFilledStyle;
    case ToggleVariant.outline:
      return toggleOutlinedStyle;
  }
}
