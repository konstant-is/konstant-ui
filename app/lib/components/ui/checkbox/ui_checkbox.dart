import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

final checkboxStyle = UIBoxStyle();

class UICheckbox extends StatefulWidget {
  final bool value;
  final String label;
  final void Function(bool value) onChange;

  const UICheckbox({
    super.key,
    required this.label,
    required this.onChange,
    this.value = false,
  });

  @override
  State<UICheckbox> createState() => _UICheckboxState();
}

class _UICheckboxState extends State<UICheckbox> {
  bool isChecked = false;
  @override
  void initState() {
    isChecked = widget.value;
    super.initState();
  }

  void onChange() {
    final value = !isChecked;
    setState(() {
      isChecked = value;
      widget.onChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BoxBuilder(
      style: UIBoxStyle(),
      onTap: onChange,
      builder: (BuildContext context, focusControl, BoxStyle style) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            box(),
            UISpace.w(UIInsets.x1),
            UIText.p(
              widget.label,
              style: (style) => style.copyWith(
                weight: FontWeight.w500,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget box() {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
          border: Border.all(color: UIColors.twGray400),
          borderRadius: BorderRadius.circular(
            UIInsets.half,
          )),
      child: isChecked ? Center(child: UIIcon(icon: UIIcons.check)) : null,
    );
  }
}
