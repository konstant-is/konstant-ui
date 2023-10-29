import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/ui_colors.dart';
import 'package:app/styles/ui_insets.dart';
import 'package:flutter/material.dart';

class UISwitch extends StatefulWidget {
  final String? label;
  final bool value;
  final ValueChanged<bool> onChange;
  final bool isDisabled;

  const UISwitch({
    Key? key,
    this.value = false,
    required this.onChange,
    this.label,
    this.isDisabled = false,
  }) : super(key: key);

  @override
  State<UISwitch> createState() => _UISwitchState();
}

class _UISwitchState extends State<UISwitch> {
  late Alignment _alignment;
  late bool _value;
  final _duration = const Duration(milliseconds: 100);
  final double _width = 40;
  final double _height = 20;
  final double _circleSize = 18;

  Color get interactiveColor =>
      _value ? UIColors.twSlate950 : UIColors.twGray200;

  @override
  void initState() {
    _alignment = getAlignment(widget.value);
    _value = widget.value;
    super.initState();
  }

  void onTap(bool value) {
    if (widget.isDisabled) return;
    setState(() {
      _alignment = getAlignment(value);
      _value = value;
    });
    widget.onChange(value);
  }

  Alignment getAlignment(bool value) =>
      value ? Alignment.centerRight : Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return BoxBuilder(
      onTap: () => onTap(!_value),
      customChild: true,
      style: UIBoxStyle(),
      isDisabled: widget.isDisabled,
      builder: (context, focusControl, style) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildSwitch(),
            if (widget.label != null) ...[
              Space.w(UIInsets.x1),
              UIText.label(widget.label!)
            ]
          ],
        );
      },
    );
  }

  Widget buildSwitch() {
    return Opacity(
      opacity: widget.isDisabled ? 0.5 : 1,
      child: AnimatedContainer(
        duration: _duration,
        width: _width,
        height: _height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0),
          border: Border.all(color: interactiveColor, width: 1),
          color: interactiveColor,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedAlign(
              alignment: _alignment,
              duration: _duration,
              curve: Curves.linear,
              child: circle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget circle() {
    return Container(
        width: _circleSize,
        height: _circleSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ));
  }
}
