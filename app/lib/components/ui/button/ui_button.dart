import 'package:app/components/ui/button/button_builder.dart';
import 'package:app/components/ui/button/button_style.dart';
import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/elements/ui_spinner.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';

import 'package:flutter/material.dart';

enum BtnVariant {
  primary,
  secondary,
  destructive,
  outline,
  ghost,
  link,
}

final button = UIButtonStyle(
  color: UIColors.twSlate900,
  textColor: Colors.white,
  hoverStyle: BtnStyle(color: UIColors.twSlate700, textColor: Colors.white),
  activeStyle: BtnStyle(color: UIColors.twSlate950, textColor: Colors.white),
);

final primary = UIButtonStyle(
  color: UIColors.twSlate900,
  textColor: Colors.white,
  hoverStyle: BtnStyle(color: UIColors.twSlate700, textColor: Colors.white),
  activeStyle: BtnStyle(color: UIColors.twSlate950, textColor: Colors.white),
);

final secondary = UIButtonStyle(
  color: UIColors.twGray200,
  textColor: UIColors.twGray950,
  hoverStyle:
      BtnStyle(color: UIColors.twGray100, textColor: UIColors.twGray950),
  activeStyle:
      BtnStyle(color: UIColors.twGray300, textColor: UIColors.twGray950),
);

final destructive = UIButtonStyle(
  color: UIColors.twRed500,
  textColor: Colors.white,
  hoverStyle: BtnStyle(color: UIColors.twRed400, textColor: Colors.white),
  activeStyle: BtnStyle(color: UIColors.twRed600, textColor: Colors.white),
);

final outline = UIButtonStyle(
  color: null,
  textColor: UIColors.twGray900,
  borderRadius: BorderRadius.circular(UIInsets.x1),
  border: Border.all(color: UIColors.twGray300),
  hoverStyle: BtnStyle(
    color: UIColors.twGray100,
    border: Border.all(color: UIColors.twGray300),
    textColor: UIColors.twGray900,
  ),
  activeStyle: BtnStyle(
    color: UIColors.twGray200,
    border: Border.all(color: UIColors.twGray300),
    textColor: UIColors.twGray900,
  ),
);

final ghost = UIButtonStyle(
  textColor: UIColors.twGray950,
  hoverStyle: BtnStyle(
    color: UIColors.twGray200,
    textColor: UIColors.twGray950,
  ),
  activeStyle: BtnStyle(
    color: UIColors.twGray300,
    textColor: UIColors.twGray950,
  ),
);

final link = UIButtonStyle(
  textColor: UIColors.twGray950,
  hoverStyle: BtnStyle(textColor: UIColors.twGray500),
  activeStyle: BtnStyle(textColor: UIColors.twGray950),
);

final icon = UIButtonStyle();

class UIButton extends StatelessWidget {
  final String? text;
  final UIButtonStyle? style;
  final UIButtonType? type;
  final VoidCallback onTap;
  final FocusNode? focusNode;
  final Widget? child;
  final Widget Function(BtnStyle style)? leading;
  final Widget Function(BtnStyle style)? trailing;
  final bool isLoading;
  final BtnVariant variant;

  const UIButton(
      {super.key,
      this.text,
      required this.onTap,
      this.style,
      this.focusNode,
      this.child,
      this.leading,
      this.type,
      this.trailing,
      this.isLoading = false,
      this.variant = BtnVariant.primary});

  factory UIButton.primary({
    required VoidCallback onTap,
    String? text,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? child,
    final Widget Function(BtnStyle style)? leading,
    final Widget Function(BtnStyle style)? trailing,
    bool isLoading = false,
  }) =>
      UIButton(
        onTap: onTap,
        variant: BtnVariant.primary,
        text: text,
        type: type,
        focusNode: focusNode,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
        child: child,
      );

  factory UIButton.secondary({
    required VoidCallback onTap,
    String? text,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? child,
    final Widget Function(BtnStyle style)? leading,
    final Widget Function(BtnStyle style)? trailing,
    bool isLoading = false,
  }) =>
      UIButton(
        onTap: onTap,
        variant: BtnVariant.secondary,
        text: text,
        type: type,
        focusNode: focusNode,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
        child: child,
      );

  factory UIButton.destructive({
    required VoidCallback onTap,
    String? text,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? child,
    final Widget Function(BtnStyle style)? leading,
    final Widget Function(BtnStyle style)? trailing,
    bool isLoading = false,
  }) =>
      UIButton(
        onTap: onTap,
        variant: BtnVariant.destructive,
        text: text,
        type: type,
        focusNode: focusNode,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
        child: child,
      );

  factory UIButton.outline({
    required VoidCallback onTap,
    String? text,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? child,
    final Widget Function(BtnStyle style)? leading,
    final Widget Function(BtnStyle style)? trailing,
    bool isLoading = false,
  }) =>
      UIButton(
        onTap: onTap,
        variant: BtnVariant.outline,
        text: text,
        type: type,
        focusNode: focusNode,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
        child: child,
      );

  factory UIButton.ghost({
    required VoidCallback onTap,
    String? text,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? child,
    final Widget Function(BtnStyle style)? leading,
    final Widget Function(BtnStyle style)? trailing,
    bool isLoading = false,
  }) =>
      UIButton(
        onTap: onTap,
        variant: BtnVariant.ghost,
        text: text,
        type: type,
        focusNode: focusNode,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
        child: child,
      );

  factory UIButton.link({
    required VoidCallback onTap,
    String? text,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? child,
    final Widget Function(BtnStyle style)? leading,
    final Widget Function(BtnStyle style)? trailing,
    bool isLoading = false,
  }) =>
      UIButton(
        onTap: onTap,
        variant: BtnVariant.link,
        text: text,
        type: type,
        focusNode: focusNode,
        leading: leading,
        trailing: trailing,
        isLoading: isLoading,
        child: child,
      );

  static Widget icon({
    required VoidCallback onTap,
    required IconData icon,
    double? size,
    BtnVariant variant = BtnVariant.ghost,
    UIButtonStyle? style,
    UIButtonType? type,
    FocusNode? focusNode,
    Widget? trailing,
    bool isLoading = false,
  }) =>
      ButtonBuilder(
          onTap: onTap,
          style: style ?? _variant(variant),
          builder: (context, control, btnStyle) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isLoading
                    ? UISpinner(
                        color: btnStyle.textColor,
                      )
                    : UIIcon(
                        icon: icon,
                        size: size,
                        color: btnStyle.textColor,
                      )
              ],
            );
          });

  @override
  Widget build(BuildContext context) {
    return ButtonBuilder(
      onTap: onTap,
      style: style ?? _variant(variant),
      builder: (context, control, btnStyle) => container(btnStyle),
    );
  }

  Widget buildLeading(BtnStyle st) {
    if (isLoading) {
      return UISpinner(color: st.textColor);
    }

    if (leading == null) return const SizedBox();

    return leading!(st);
  }

  Widget container(BtnStyle btnStyle) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildLeading(btnStyle),
        UISpace.w(UIInsets.half),
        child ?? const SizedBox(),
        text == null
            ? const SizedBox()
            : UIText.p(
                text!,
                textAlign: TextAlign.center,
                style: (style) => style.copyWith(
                  color: btnStyle.textColor,
                  weight: FontWeight.w500,
                ),
              ),
        UISpace.w(UIInsets.half),
        trailing == null ? const SizedBox() : trailing!(btnStyle),
      ],
    );
  }
}

final textStyle = uiTextStyle;
UIButtonStyle _variant(BtnVariant variant) {
  switch (variant) {
    case BtnVariant.primary:
      return primary;
    case BtnVariant.secondary:
      return secondary;
    case BtnVariant.destructive:
      return destructive;
    case BtnVariant.outline:
      return outline;
    case BtnVariant.ghost:
      return ghost;
    case BtnVariant.link:
      return link;
  }
}
