import 'package:konstant_ui/src/templates/template.dart';
import 'package:test/test.dart';
import 'package:konstant_ui/src/templates/component_template.dart';

void main() {
  const mockCode = '''
    import 'package:konstant_ui/impl/dependency.dart';
    import 'package:flutter/material.dart';
    class MockComponent {
      // ... mock component content
    }
  ''';

  final component = ComponentTemplate(
    path: 'components/mock_component.dart',
    code: mockCode,
  );

  group('Template', () {
    test('Template initialization', () {
      // const alias = 'myalias';
      final template = Template(
        // alias: alias,
        component: component,
      );

      expect(template.componentPath, component.path);
      // expect(template.writePath, '$alias/${component.path}');
    });
    test('Getting Konstant UI Dependencies', () {
      final template = Template(
        // alias: 'myalias',
        component: component,
      );

      final dependencies = template.getKonstantUIDependencies();

      expect(dependencies, ['konstant_ui/impl/dependency.dart']);
    });

    test('Generating Code', () {
      final template = Template(
        // alias: 'myalias',
        component: component,
      );

      final newContent = template.generateCode(
        packageName: 'my_package',
        konstantPackageName: "konstant_ui/impl",
      );

      expect(newContent, '''
    import 'package:my_package/dependency.dart';
    import 'package:flutter/material.dart';
    class MockComponent {
      // ... mock component content
    }
  ''');
    });
  });
}
