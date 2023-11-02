import 'package:konstant_ui/src/templates/component_template.dart';
import 'package:konstant_ui/utils/utils.dart';

ComponentTemplate createWidgetbookAppTemplate(String path) {
  String fileName = "widgetbook_app";
  return ComponentTemplate(
    path: "$path/$fileName.dart",
    code: _widgetbookAppCode(fileName),
  );
}

ComponentTemplate createWidgetbookComponents() {
  return decodeTemplate("widgetbook/widgetbook_components.dart");
}

String _widgetbookAppCode(String fileName) => '''
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '$fileName.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [],
    );
  }
}

''';
