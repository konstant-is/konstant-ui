import 'package:konstant_ui/src/constants.dart';
import 'package:konstant_ui/src/templates/component_template.dart';

/// A class representing a template for generating Dart code from a component.
class Template {
  // final String alias;
  final ComponentTemplate component;

  Template({
    // required this.alias,
    required this.component,
  });

  String get componentPath => component.path;
  // String get writePath => "$alias/$componentPath";

  /// Get a list of Konstant UI dependencies by package name.
  ///
  /// [packageName] is the package name to filter by.
  List<String> getKonstantUIDependencies({
    String packageName = Constants.konstantUIPackageName,
  }) {
    return component.imports
        .where((element) => element.startsWith(packageName))
        .toList();
  }

  /// Replaces the component code imports with [packageName].
  ///
  /// [packageName] is the package name to replace imports with.
  /// [konstantPackageName] is the name of the Konstant UI package to replace.
  String generateCode({
    required String packageName,
    String konstantPackageName = Constants.konstantUIImplPackageName,
  }) {
    final importsPattern = RegExp("import 'package:$konstantPackageName(.*?)'");

    return component.code.replaceAllMapped(importsPattern, (match) {
      final importRest = match.group(1) ?? '';
      final import = "$packageName/$importRest";

      return "import 'package:$import'";
    });
  }
}
