import 'package:flutter/material.dart';
import 'package:konstant_ui/impl/components/ui/elements/ui_icons.dart';

class UISpinner extends StatefulWidget {
  final Color? color;
  const UISpinner({super.key, this.color});

  @override
  State<UISpinner> createState() => _UISpinnerState();
}

class _UISpinnerState extends State<UISpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UIIcon(
      icon: UIIcons.loader(),
      color: widget.color,
      animation: UIAnimation(
        animation: UIAnim.spin,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
