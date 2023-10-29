import 'package:app/components/ui/toggle/ui_toggle.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class UIToggleList extends StatefulWidget {
  final List<UIToggle> items;
  final void Function(Set<String> value) onChange;
  final int? maxSelectable;

  const UIToggleList({
    super.key,
    required this.items,
    required this.onChange,
    this.maxSelectable,
  });

  @override
  State<UIToggleList> createState() => _UIToggleListState();
}

class _UIToggleListState extends State<UIToggleList> {
  final Map<int, bool> _state = {};

  @override
  initState() {
    super.initState();

    for (var i = 0; i < widget.items.length; i++) {
      final toggle = widget.items[i];
      _state[i] = toggle.value;
    }
  }

  onChange(int index, bool toggled) {
    final value = _state[index] ?? false;
    if (widget.maxSelectable != null) {
      final selectedAmount =
          _state.entries.map((e) => e.value).where((v) => v).toList();

      if (selectedAmount.length >= widget.maxSelectable! && value == false) {
        return;
      }
    }

    updateState(index, toggled);
  }

  void updateState(int index, bool toggled) {
    setState(() {
      _state[index] = toggled;
    });

    final selected = _state.entries
        .where((element) => element.value)
        .map((e) => e.key)
        .map((e) => widget.items[e].name)
        .toSet();

    widget.onChange(selected);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: UIInsets.half,
      runSpacing: UIInsets.half,
      children: widget.items.asMap().entries.map((entry) {
        final index = entry.key;
        final toggle = entry.value;
        final val = _state[index];

        return toggle.copyWith(
          value: val,
          onTap: (toggled) => onChange(index, toggled),
        );
      }).toList(),
    );
  }
}
