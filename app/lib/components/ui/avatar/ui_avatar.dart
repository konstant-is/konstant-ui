import 'package:app/components/ui/builders/box_builder.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';

class UIAvatar extends StatefulWidget {
  final Widget? fallback;
  final double radius;
  final ImageProvider? image;
  final Widget? child;
  final VoidCallback? onTap;

  const UIAvatar({
    super.key,
    this.fallback,
    this.radius = 20,
    this.image,
    this.onTap,
    this.child,
  });

  @override
  State<UIAvatar> createState() => _UIAvatarState();
}

class _UIAvatarState extends State<UIAvatar> {
  bool showFallbak = false;

  @override
  void initState() {
    showFallbak = widget.image == null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final minDiameter = _minDiameter;
    final maxDiameter = _maxDiameter;

    return BoxBuilder(
      onTap: widget.onTap,
      style: UIBoxStyle(),
      customChild: true,
      builder: (context, focusControl, style) {
        return AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: minDiameter,
            minWidth: minDiameter,
            maxWidth: maxDiameter,
            maxHeight: maxDiameter,
          ),
          decoration: BoxDecoration(
            color: UIColors.twGray300,
            image: widget.image != null
                ? DecorationImage(
                    image: widget.image!,
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      setState(() {
                        showFallbak = true;
                      });
                    },
                  )
                : null,
            shape: BoxShape.circle,
          ),
          duration: const Duration(milliseconds: 300),
          child: fallback,
        );
      },
    );
  }

  Widget? get fallback {
    if (showFallbak) return Center(child: widget.child);
    return null;
  }

  double get _minDiameter {
    return 2.0 * widget.radius;
  }

  double get _maxDiameter {
    return 2.0 * widget.radius;
  }
}
