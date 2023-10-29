import 'package:konstant_ui/src/templates/component_template.dart';

ComponentTemplate createWidgetbookAppTemplate(String path) {
  String fileName = "widgetbook_app";
  return ComponentTemplate(
    path: "$path/$fileName.dart",
    code: _widgetbookAppCode(fileName),
  );
}

ComponentTemplate createWidgetbookComponents(String path) {
  return ComponentTemplate(
    path: "$path/widgetbook_components.dart",
    code: _widgetBookComponentsCode,
  );
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

String _widgetBookComponentsCode = '''
import 'package:flutter/material.dart';

class WBPage extends StatelessWidget {
  final List<Widget> children;

  const WBPage({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(42),
          children: [
            const Text(
              "Examples",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 40),
            ...children,
          ],
        ));
  }
}

class WBCase extends StatelessWidget {
  final String? title;
  final Widget child;
  final double maxWidth;

  const WBCase(
      {super.key,
      this.title,
      required this.child,
      this.maxWidth = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title ?? "",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
        ],
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 54),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          child: Center(
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: child,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

''';
