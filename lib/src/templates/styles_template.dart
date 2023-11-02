import 'package:konstant_ui/src/tailwind_colors.dart';

import 'package:konstant_ui/src/templates/component_template.dart';
import 'package:konstant_ui/utils/string_buffer_utils.dart';
import 'package:konstant_ui/utils/utils.dart';

typedef ColorMap = Map<String, dynamic>;
ComponentTemplate createColorTemplate(String path, ColorMap colors) {
  return ComponentTemplate(
    path: "$path/ui_colors.dart",
    code: _generateColors(colors),
  );
}

ComponentTemplate createInsetTemplate(String path, {double baseInset = 8}) {
  return ComponentTemplate(
    path: "$path/ui_insets.dart",
    code: _generateInsets(baseInset),
  );
}

ComponentTemplate styleExportTemplate(String path) {
  return ComponentTemplate(
    path: "$path/styles.dart",
    code: '''
library ui_styles;

export './ui_insets.dart';
export './ui_colors.dart';
''',
  );
}

String _generateColors(ColorMap colors) {
  final buffer = StringBufferUtils();

  buffer.writeImports({"package:flutter/material.dart"});
  buffer.writeln("class UIColors {");

  buffer.writeln('// Custom colors', padding: 4);

  final customColors = parseColor(colors);
  final twColors = parseColor(tailwindColors);
  for (var e in customColors.entries) {
    buffer.writeln(_generateColorField(e.key, e.value), padding: 4);
  }

  buffer.writeln(
    '// Other constants and methods can be added here',
    padding: 4,
    postlines: 1,
  );

  buffer.writeln('// Tailwind colors', padding: 4);
  for (var e in twColors.entries) {
    buffer.writeln(
      _generateColorField("tw${e.key.capitalize}", e.value),
      padding: 4,
    );
  }

  buffer.writeln('}');

  return buffer.toString();
}

_generateColorField(String name, String color) =>
    "static const Color $name = ${_createColorFromHex(color)};";

String _generateInsets(double baseInset) {
  final template = decodeTemplate("styles/ui_insets.dart");

  final RegExp pattern = RegExp(r'_kuiBaseInset\s*=\s*([\d.]+)');
  final match = pattern.firstMatch(template.code);

  return match != null
      ? template.code.replaceFirst(pattern, '_kuiBaseInset = $baseInset')
      : template.code;
}

String _createColorFromHex(String color) {
  // TODO: handle RGBO

  final fromHex = "0xFF${color.substring(1)}".toUpperCase();
  return "Color($fromHex)";
}
