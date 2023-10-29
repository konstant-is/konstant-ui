import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusActionBuilder extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback? onLongTap;
  final FocusNode? focusNode;
  final bool enabled;
  final bool requestFocusOnPress;
  final SystemMouseCursor? cursor;
  final Map<Type, Action<Intent>>? actions;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final HitTestBehavior? hitTestBehavior;
  final bool autoFocus;
  final bool descendantsAreFocusable;
  final bool descendantsAreTraversable;
  final Widget Function(BuildContext context, FocusControlState control)
      builder;

  /// Called after the hover state has changed.
  final void Function(BuildContext context, FocusControlState control)?
      onHoverChanged;

  /// Called after the focus state has changed.
  final void Function(BuildContext context, FocusControlState control)?
      onFocusChanged;

  const FocusActionBuilder({
    super.key,
    required this.builder,
    required this.onTap,
    this.focusNode,
    this.onLongTap,
    this.enabled = true,
    this.requestFocusOnPress = true,
    this.cursor,
    this.actions,
    this.shortcuts,
    this.hitTestBehavior,
    this.autoFocus = false,
    this.descendantsAreFocusable = true,
    this.descendantsAreTraversable = true,
    this.onHoverChanged,
    this.onFocusChanged,
  });

  @override
  State<FocusActionBuilder> createState() => FocusControlState();
}

class FocusControlState extends State<FocusActionBuilder> {
  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  bool _isHovered = false;
  bool get isHovered => _isHovered;

  bool _isFocused = false;
  bool get isFocused => _isFocused;

  bool get hasPressHandler => widget.onTap != null;
  bool _isActive = false;
  bool get isActive => _isActive;

  bool _wasHovered = false;
  bool get wasHovered => _wasHovered;

  bool _wasFocused = false;
  bool get wasFocused => _wasFocused;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _handleHoverChanged(v) {
    setState(() => _isHovered = v);
    widget.onHoverChanged?.call(context, this);
    _wasHovered = v;
  }

  void _handleFocusChanged(v) {
    setState(() => _isFocused = v);
    widget.onFocusChanged?.call(context, this);

    _wasFocused = v;
  }

  void _handlePressed() {
    if (widget.requestFocusOnPress) {
      _focusNode.requestFocus();
    }

    widget.onTap?.call();
  }

  /// By default, will bind the [ActivateIntent] from the flutter SDK to the onPressed callback.
  /// This will enable SPACE and ENTER keys on most platforms.
  /// Also accepts additional actions provided externally.
  Map<Type, Action<Intent>> _getKeyboardActions() {
    return {
      if (hasPressHandler) ...{
        ActivateIntent:
            CallbackAction<Intent>(onInvoke: (_) => _handlePressed()),
      },
      ...(widget.actions ?? {}),
    };
  }

  @override
  Widget build(BuildContext context) {
    MouseCursor defaultCursor =
        hasPressHandler ? SystemMouseCursors.click : MouseCursor.defer;
    MouseCursor cursor = widget.cursor ?? defaultCursor;

    // Create the core FocusableActionDetector
    Widget content = FocusableActionDetector(
      enabled: widget.enabled,
      focusNode: _focusNode,
      autofocus: widget.autoFocus,
      descendantsAreFocusable: widget.descendantsAreFocusable,
      descendantsAreTraversable: widget.descendantsAreTraversable,
      onFocusChange: _handleFocusChanged,
      onShowFocusHighlight: _handleFocusChanged,
      onShowHoverHighlight: _handleHoverChanged,
      shortcuts: widget.shortcuts,
      mouseCursor: cursor,
      actions: _getKeyboardActions(),
      child: widget.builder(context, this),
    );

    return GestureDetector(
      onTapDown: (details) => setState(() {
        _isActive = true;
      }),
      onTapUp: (details) => setState(() {
        _isActive = false;
      }),
      onTapCancel: () => setState(() {
        _isActive = false;
      }),
      behavior: widget.hitTestBehavior,
      onTap: widget.onTap == null ? null : _handlePressed,
      onLongPress: widget.onLongTap,
      child: content,
    );
  }
}
