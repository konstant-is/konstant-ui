import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/toggle/toggle_style.dart';
import 'package:app/components/ui/toggle/ui_toggle.dart';

import 'package:flutter/material.dart';

class UIToggleButton extends StatefulWidget {
  final String? text;
  final String name;
  final bool? value;
  final Widget? child;
  final ToggleVariant variant;
  final UIToggleStyle? style;
  final void Function(bool toggled)? onChange;
  final Widget Function(ToggleStyle style)? leading;
  final Widget Function(ToggleStyle style)? trailing;

  const UIToggleButton({
    super.key,
    required this.name,
    this.text,
    this.child,
    this.value,
    this.onChange,
    this.style,
    this.leading,
    this.trailing,
    this.variant = ToggleVariant.filled,
  });

  @override
  State<UIToggleButton> createState() => UIToggleButtonState();

  factory UIToggleButton.outline({
    required String name,
    String? text,
    bool? value,
    Widget? child,
    UIToggleStyle? style,
    void Function(bool toggled)? onChange,
    Widget Function(ToggleStyle style)? leading,
    Widget Function(ToggleStyle style)? trailing,
  }) {
    return UIToggleButton(
      name: name,
      variant: ToggleVariant.outline,
      text: text,
      style: style,
      onChange: onChange,
      leading: leading,
      trailing: trailing,
      child: child,
    );
  }

  factory UIToggleButton.filled({
    required String name,
    String? text,
    bool? value,
    Widget? child,
    UIToggleStyle? style,
    void Function(bool toggled)? onChange,
    Widget Function(ToggleStyle style)? leading,
    Widget Function(ToggleStyle style)? trailing,
  }) {
    return UIToggleButton(
      name: name,
      variant: ToggleVariant.filled,
      text: text,
      style: style,
      onChange: onChange,
      leading: leading,
      trailing: trailing,
      child: child,
    );
  }

  factory UIToggleButton.icon({
    required String name,
    required IconData icon,
    bool? value,
    UIToggleStyle? style,
    void Function(bool toggled)? onChange,
  }) =>
      UIToggleButton(
        name: name,
        onChange: onChange,
        value: value,
        style: style,
        child: UIIcon(icon: icon),
      );

  UIToggleButton copyWith({
    String? text,
    bool? value,
    Widget? child,
    UIToggleStyle? style,
    void Function(bool toggled)? onChange,
    Widget Function(ToggleStyle style)? leading,
    Widget Function(ToggleStyle style)? trailing,
  }) {
    return UIToggleButton(
      name: name,
      text: text ?? this.text,
      value: value ?? this.value,
      style: style ?? this.style,
      onChange: onChange ?? this.onChange,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
      variant: variant,
      child: child ?? this.child,
    );
  }
}

class UIToggleButtonState extends State<UIToggleButton> {
  late bool _toggled;

  @override
  void initState() {
    super.initState();
    _toggled = widget.value ?? false;
  }

  @override
  didUpdateWidget(UIToggleButton oldWidget) {
    setState(() {
      _toggled = _toggled;
    });
    super.didUpdateWidget(oldWidget);
  }

  setToggle() {
    setState(() {
      _toggled = !_toggled;
    });

    if (widget.onChange != null) {
      widget.onChange!(_toggled);
    }
  }

  @override
  Widget build(BuildContext context) {
    return UIToggle(
      name: widget.name,
      value: _toggled,
      onTap: (toggled) => setToggle(),
      variant: widget.variant,
      text: widget.text,
      leading: widget.leading,
      trailing: widget.trailing,
      child: widget.child,
    );
  }
}
