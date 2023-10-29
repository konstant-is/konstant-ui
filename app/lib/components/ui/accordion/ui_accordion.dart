import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/components/ui/elements/ui_icons.dart';
import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/styles/styles.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

final accordionStyle = UIBoxStyle(
  textWeight: FontWeight.w500,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: UIColors.twGray200,
      ),
    ),
  ),
);

class UIAccordion extends StatefulWidget {
  final List<UIAccordionItem> items;
  final UIBoxStyle? style;

  const UIAccordion({
    super.key,
    required this.items,
    this.style,
  });

  @override
  State<UIAccordion> createState() => _UIAccordionState();
}

class _UIAccordionState extends State<UIAccordion> {
  int? activeIndex;

  void onTap(int index) {
    int? updated = index == activeIndex ? null : index;

    setState(() {
      activeIndex = updated;
    });
  }

  @override
  Widget build(BuildContext context) {
    final style = widget.style ?? accordionStyle;
    return Column(
        children: widget.items
            .mapIndexed(
              (index, e) => Container(
                decoration: style.decoration,
                child: AccordionTrigger(
                  item: e,
                  onTap: () => onTap(index),
                  isExpanded: activeIndex == index,
                  style: style,
                ),
              ),
            )
            .toList());
  }
}

class AccordionTrigger extends StatefulWidget {
  final UIAccordionItem item;
  final VoidCallback onTap;
  final bool isExpanded;
  final UIBoxStyle style;

  const AccordionTrigger({
    super.key,
    required this.item,
    required this.onTap,
    required this.isExpanded,
    required this.style,
  });

  @override
  State<AccordionTrigger> createState() => _AccordionTriggerState();
}

class _AccordionTriggerState extends State<AccordionTrigger>
    with TickerProviderStateMixin {
  final _expandDuration = const Duration(milliseconds: 300);
  late AnimationController _iconController;
  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 0.5,
    );

    _expandController = AnimationController(
      vsync: this,
      duration: _expandDuration,
    );

    Animation<double> curve = CurvedAnimation(
      parent: _expandController,
      curve: Curves.fastOutSlowIn,
    );
    _expandAnimation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _expandController.dispose();
    _iconController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(AccordionTrigger oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _expandController.forward();
      _iconController.forward(from: 0.0);
      return;
    }
    if (oldWidget.isExpanded != widget.isExpanded) {
      _expandController.reverse();
      _iconController.reverse(from: 0.5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _trigger(),
        SizeTransition(
            axisAlignment: 1.0,
            sizeFactor: _expandAnimation,
            child: AnimatedOpacity(
              duration: _expandDuration,
              opacity: widget.isExpanded ? 1 : 0,
              child: Container(
                padding: pb(UIInsets.x2),
                child: widget.item.content,
              ),
            )),
      ],
    );
  }

  Widget _trigger() {
    return BoxBuilder(
      onTap: widget.onTap,
      style: UIBoxStyle(padding: py(UIInsets.x2)),
      builder: (context, focusControl, style) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UIText.p(
              widget.item.label,
              style: (textStyle) => textStyle.copyWith(
                weight: widget.style.textWeight,
                color: widget.style.textColor,
              ),
            ),
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_iconController),
              child: UIIcon(
                color: widget.style.textColor,
                icon: UIIcons.chevron(direction: UIDirection.down),
              ),
            ),
          ],
        );
      },
    );
  }
}

class UIAccordionItem {
  final String label;
  final Widget content;

  const UIAccordionItem({
    required this.label,
    required this.content,
  });
}
