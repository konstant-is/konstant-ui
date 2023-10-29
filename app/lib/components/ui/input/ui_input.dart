import 'package:app/components/ui/text/ui_text.dart';
import 'package:app/components/ui/text/ui_text_style.dart';
import 'package:app/utils/utils.dart';
import 'package:app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _border = OutlineInputBorder(
  borderSide: const BorderSide(color: UIColors.twGray200),
  borderRadius: BorderRadius.circular(UIInsets.half),
);

final _padding = EdgeInsets.symmetric(
  vertical: UIInsets.x2,
  horizontal: UIInsets.x1AddHalf,
);

final _textStyle = UITextStyle(color: UIColors.twGray950, size: textBaseSize);
final _hintTextStyle = UITextStyle(
  color: UIColors.twGray500,
  size: textBaseSize,
);
final _labelTextStyle = UITextStyle(
  color: UIColors.twGray950,
  size: textBaseSize,
);
final _descriptionTextStyle = UITextStyle(
  color: UIColors.twGray500,
  size: textBaseSize,
);

InputDecoration decoration = InputDecoration(
  isDense: true,
  filled: false,
  // fillColor: UIColors.twGray50,
  errorMaxLines: 2,
  border: _border,
  enabledBorder: _border,
  contentPadding: _padding,
  hintStyle: _hintTextStyle.style,

  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: UIColors.twGray300, width: 1.5),
    borderRadius: BorderRadius.circular(UIInsets.half),
  ),
  disabledBorder: _border.copyWith(
    borderSide: const BorderSide(color: UIColors.twGray100),
  ),
);

class UIInput extends StatefulWidget {
  final String? name;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;
  final String? value;
  final String? placeholder;
  final String? Function(String? val)? validator;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? label;
  final List<TextInputFormatter>? formatters;
  final Function(String value)? onSubmit;
  final Duration? debounce;
  final bool disabled;
  final String? description;

  const UIInput({
    super.key,
    this.name,
    this.controller,
    this.onChange,
    this.value,
    this.placeholder,
    this.validator,
    this.obscureText,
    this.keyboardType,
    this.label,
    this.formatters,
    this.onSubmit,
    this.debounce,
    this.disabled = false,
    this.description,
  });

  @override
  State<UIInput> createState() => InputState();
}

class InputState extends State<UIInput> {
  late TextEditingController? _localController;
  Debouncer? _debouncer;

  @override
  void initState() {
    _localController = widget.controller == null
        ? TextEditingController(text: widget.value)
        : null;

    if (widget.debounce != null) {
      _debouncer = Debouncer(duration: widget.debounce!);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant UIInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the widget.value changes, update the controller and the input field.
    if (_localController != null &&
        widget.value != null &&
        oldWidget.value != widget.value) {
      _localController!.text = widget.value!;
    }
  }

  @override
  void dispose() {
    _localController?.dispose();
    _debouncer?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          UIText(text: widget.label!, style: _labelTextStyle),
          Space.h(UIInsets.x1),
        ],
        TextFormField(
            controller: widget.controller ?? _localController,
            onChanged: onChanged,
            onFieldSubmitted: widget.onSubmit,
            textInputAction: TextInputAction.search,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            inputFormatters: widget.formatters,
            style: _textStyle.getTextStyle(),
            obscureText: widget.obscureText ?? false,
            enabled: !widget.disabled,
            decoration: decoration.copyWith(hintText: widget.placeholder)),
        if (widget.description != null) ...[
          Space.h(UIInsets.x1),
          UIText(text: widget.description!, style: _descriptionTextStyle)
        ]
      ],
    );
  }

  onChanged(String? value) {
    if (widget.onChange == null) {
      return;
    }

    if (_debouncer != null) {
      _debouncer!.run(() {
        widget.onChange!(value ?? "");
      });

      return;
    }

    widget.onChange!(value ?? "");
  }
}
