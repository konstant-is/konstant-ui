import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/button/button_style.dart';
import 'package:app/components/ui/button/ui_button.dart';
import 'package:app/components/ui/dialog/ui_dialog.dart';
import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/ui_colors.dart';
import 'package:app/styles/ui_insets.dart';
import 'package:flutter/material.dart';

class UIDialogBuilder extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final EdgeInsets? padding;
  final List<Widget> actions;

  final Widget Function(BuildContext context) builder;

  const UIDialogBuilder({
    super.key,
    this.padding,
    this.actions = const [],
    this.title,
    required this.builder,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: padding ??
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 1,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          // padding: pa(UIInsets.x3),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(UIInsets.x1),
            border: Border.all(color: UIColors.twGray400),
          ),
          child: Stack(
            children: [
              Positioned(top: 16, right: 20, child: _closeBtn(context)),
              body(context),
            ],
          )),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      padding: pa(UIInsets.x3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) _header(),
          builder(context),
          if (actions.isNotEmpty) DialogFooter(children: actions)
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DialogHeader(
            title: title,
            subtitle: subtitle,
          ),
        ),
        SizedBox(width: UIInsets.x4)
      ],
    );
  }

  Widget _closeBtn(BuildContext context) {
    return UIButton.icon(
      onTap: () => UIDialog.close(context),
      style: UIButtonStyle(
          padding: pa(2),
          activeStyle: BtnStyle(
            color: UIColors.twGray200,
          )),
      icon: UIIcons.x,
    );
    // return BoxBuilder(
    //   onTap: ,
    //   style: UIBoxStyle(),
    //   customChild: true,
    //   builder: (BuildContext context, focusControl, BoxStyle style) {

    //   },
    // );
  }
}

class DialogHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? child;

  const DialogHeader({super.key, this.child, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: pb(UIInsets.x4),
      child: child ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null) UIText.lg(title!),
              if (title != null && subtitle != null) Space.h(UIInsets.x1),
              if (subtitle != null)
                UIText.p(
                  subtitle!,
                  style: (style) => style.copyWith(weight: FontWeight.w300),
                ),
            ],
          ),
    );
  }
}

class DialogFooter extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const DialogFooter({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.end,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? pt(UIInsets.x4),
      padding: padding,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
