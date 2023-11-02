import 'package:test/test.dart';
import 'package:konstant_ui/src/templates/component_template.dart';

const mockCode = '''
import 'package:konstant_ui/components/ui/button.dart';
import 'package:material/material.dart';

class MockClass {
  print() {
    print(true)
  }
}
''';

void main() {
  group('ComponentTemplate', () {
    // test('Creating a ComponentTemplate from JSON', () {
    //   final json = {
    //     'path': 'components/example.dart',
    //     'code': mockCode.codeUnits,
    //   };
    //   final componentTemplate = ComponentTemplate.fromJson(json);

    //   // Add assertions to check if the ComponentTemplate properties are correct
    //   expect(componentTemplate.path, 'components/example.dart');
    //   expect(componentTemplate.fileName, 'example.dart');
    //   expect(componentTemplate.code, utf8.decode(mockCode.codeUnits));
    // });

    test('Extracting imports from content', () {
      final componentTemplate = ComponentTemplate(
        path: 'components/example.dart',
        code: mockCode,
      );

      final imports = componentTemplate.imports;

      // Add assertions to check if the extracted imports are correct
      expect(
        imports,
        [
          "konstant_ui/components/ui/button.dart",
          "material/material.dart",
        ],
      );
    });

    test('Creating a ComponentTemplate with empty content', () {
      final componentTemplate = ComponentTemplate(
        path: 'components/example.dart',
        code: '',
      );

      final imports = componentTemplate.imports;

      // Add assertions to check if no imports are extracted from empty content
      expect(imports, isEmpty);
    });

    test('Creating a ComponentTemplate with content containing no imports', () {
      final componentTemplate = ComponentTemplate(
        path: 'components/example.dart',
        code: 'class MockClass {}',
      );

      final imports = componentTemplate.imports;

      // Add assertions to check if no imports are extracted from content with no imports
      expect(imports, isEmpty);
    });
  });
}
