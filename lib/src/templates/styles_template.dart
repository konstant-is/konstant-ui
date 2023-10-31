import 'package:konstant_ui/src/tailwind_colors.dart';

import 'package:konstant_ui/src/templates/component_template.dart';
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
  const code = '''
library ui_styles;

export './ui_insets.dart';
export './ui_colors.dart';
''';
  return ComponentTemplate(
    path: "$path/styles.dart",
    code: code,
  );
}

String _generateColors(ColorMap colors) {
  final StringBuffer classBuffer = StringBuffer();

  // Add imports and initial class structure
  classBuffer.writeln('''
import 'package:flutter/material.dart';

class UIColors {''');

  // Generate color constants based on the JSON config
  classBuffer.writeln('  // Custom colors');

  final customColors = parseColor(colors);
  final twColors = parseColor(tailwindColors);
  for (var e in customColors.entries) {
    final color = _createColorFromHex(e.value);
    classBuffer.writeln('  static const Color ${e.key} = $color;');
  }
  classBuffer.writeln('  // Other constants and methods can be added here');
  classBuffer.writeln();
  classBuffer.writeln('  // Tailwind colors');
  for (var e in twColors.entries) {
    final color = _createColorFromHex(e.value);
    classBuffer.writeln('  static const Color tw${e.key.capitalize} = $color;');
  }

  classBuffer.writeln('}');

  return classBuffer.toString();
}

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
