import 'package:konstant_ui/utils/utils.dart';

/// Represents a template for a component with its code content and import statements.
class ComponentTemplate {
  final String path;
  final String code;
  List<String> imports = [];

  /// Gets the file name from the path.
  String get fileName => path.split("/").last;

  ComponentTemplate({
    required this.path,
    required this.code,
  }) {
    imports = _setImports();
  }

  /// Converts the template to a JSON format.
  /// Code is stored in code units
  Map<String, String> toJson() {
    return {
      'path': path,
      'code': code.codeUnits.toString(),
    };
  }

  /// Extracts import statements from the code.
  List<String> _setImports() {
    final RegExp importRegExp = RegExp(
      r"^\s*import\s+'(.+?)';",
      multiLine: true,
    );

    final List<String> imports = importRegExp.allMatches(code).map((match) {
      final importLine = match.group(1)!;
      return removePackagePrefix(importLine);
    }).toList();

    return imports;
  }
}
