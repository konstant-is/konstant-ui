import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class UIRadioGroup<T> extends StatefulWidget {
  final List<UIRadioItem<T>> items;
  final T? value;
  final ValueChanged<T> onChange;

  const UIRadioGroup({
    super.key,
    required this.items,
    this.value,
    required this.onChange,
  });

  @override
  State<UIRadioGroup<T>> createState() => _UIRadioGroupState<T>();
}

class _UIRadioGroupState<T> extends State<UIRadioGroup<T>> {
  late int selectedIndex;
  Map<int, UIRadioItem<T>> values = {};

  void _onTap(int index) {
    setState(() {
      selectedIndex = index;
      widget.onChange(values[index]!.value);
    });
  }

  @override
  initState() {
    super.initState();
    for (int i = 0; i < widget.items.length; i++) {
      values[i] = widget.items[i];
    }
    selectedIndex = widget.value != null
        ? widget.items.indexWhere((element) => element.value == selectedIndex)
        : -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: widget.items
            .mapIndexed(
              (index, element) => Padding(
                padding: pb(UIInsets.x1),
                child: _RadioItem(
                  isSelected: index == selectedIndex,
                  label: element.label,
                  onTap: () => _onTap(index),
                ),
              ),
            )
            .toList());
  }
}

class UIRadioItem<T> {
  final String label;
  final T value;

  UIRadioItem({required this.label, required this.value});
}

class _RadioItem extends StatelessWidget {
  final bool isSelected;
  final String label;
  final VoidCallback onTap;

  Color get _color => isSelected ? UIColors.twZinc950 : UIColors.twGray300;
  double get radius => 14.0;

  const _RadioItem({
    required this.isSelected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BoxBuilder(
      style: UIBoxStyle(),
      onTap: onTap,
      customChild: true,
      builder: (context, focusControl, style) {
        return Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: radius,
              height: radius,
              padding: pa(2),
              decoration: BoxDecoration(
                  border: Border.all(color: _color, width: 1),
                  borderRadius: BorderRadius.circular(radius)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                    color: _color,
                    border: Border.all(color: _color),
                    borderRadius: BorderRadius.circular(radius)),
              ),
            ),
            UISpace.w(UIInsets.x2),
            UIText.label(label)
          ],
        );
      },
    );
  }
}
