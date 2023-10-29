import 'package:flutter/material.dart';
import 'package:app/components/ui/elements/ui_icons.dart';

class UISpinner extends StatelessWidget {
  final Color? color;
  const UISpinner({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return UIIcon(
      icon: UIIcons.loader,
      color: color,
      animation: UIAnimation(
        animation: UIAnim.spin,
        duration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
