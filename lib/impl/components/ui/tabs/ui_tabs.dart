import 'package:konstant_ui/impl/components/ui/builders/box_builder.dart';
import 'package:konstant_ui/impl/components/ui/text/ui_text.dart';
import 'package:konstant_ui/impl/styles/styles.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class UITab {
  final String text;
  final Widget child;
  final String value;

  UITab({required this.value, required this.text, required this.child});
}

class UITabs extends StatefulWidget {
  final List<UITab> tabs;
  final String? initalValue;
  final int? selected;
  final Function(UITab tab)? onChange;

  const UITabs(
      {super.key,
      required this.tabs,
      this.selected,
      this.onChange,
      this.initalValue});

  @override
  State<UITabs> createState() => TabsState();
}

class TabsState extends State<UITabs> {
  int selected = -1;

  @override
  void initState() {
    super.initState();
    selected = widget.selected ?? _getInitalVale();
  }

  int _getInitalVale() {
    return widget.tabs
        .indexWhere((element) => element.value == widget.initalValue);
  }

  setTab(int index) {
    setState(() {
      selected = index;
    });

    if (widget.onChange != null) {
      widget.onChange!(widget.tabs[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TabList(
          tabs: widget.tabs,
          onTap: setTab,
          selected: selected,
        ),
        _TabContent(tab: widget.tabs[selected])
      ],
    );
  }
}

class _TabContent extends StatelessWidget {
  final UITab tab;

  const _TabContent({required this.tab});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: UIInsets.base),
      margin: EdgeInsets.only(top: UIInsets.base),
      child: tab.child,
    );
  }
}

class _TabList extends StatelessWidget {
  final List<UITab> tabs;
  final Function(int index) onTap;
  final int? selected;

  const _TabList({
    required this.tabs,
    required this.onTap,
    this.selected = 0,
  });

  @override
  Widget build(BuildContext context) {
    final tabList = tabs
        .mapIndexed(
          (index, element) => _Tab(
            style: tabStyle,
            tab: element,
            isSelected: index == selected,
            onTap: () => onTap(index),
          ),
        )
        .toList();

    return Container(
      padding: EdgeInsets.all(UIInsets.half),
      decoration: BoxDecoration(
        color: UIColors.twGray100,
        borderRadius: BorderRadius.circular(UIInsets.half),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: tabList.map((child) => Expanded(child: child)).toList(),
      ),
    );
  }
}

final tabStyle = UIBoxStyle(
    color: UIColors.twGray100,
    padding: EdgeInsets.symmetric(vertical: UIInsets.base),
    textColor: UIColors.twGray600,
    hoverStyle: BoxStyle(),
    activeStyle: BoxStyle(
      color: UIColors.white,
      textColor: UIColors.twGray950,
      padding: EdgeInsets.symmetric(vertical: UIInsets.base),
    ));

class _Tab extends StatelessWidget {
  final UITab tab;
  final bool isSelected;
  final VoidCallback onTap;
  final UIBoxStyle style;

  const _Tab(
      {required this.tab,
      required this.isSelected,
      required this.onTap,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return BoxBuilder(
      onTap: onTap,
      style: style,
      isExpanded: true,
      color: isSelected ? tabStyle.activeStyle?.color : null,
      builder: (context, focusControl, style) {
        final st = getStyle() ?? tabStyle;

        return Center(
          child: UIText.p(
            tab.text,
            style: (style) =>
                style.copyWith(color: st.textColor, weight: FontWeight.w500),
          ),
        );
      },
    );
  }

  BoxStyle? getStyle() {
    if (isSelected) return tabStyle.activeStyle;

    return tabStyle;
  }
}
