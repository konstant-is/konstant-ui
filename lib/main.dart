library konstant_ui;

import 'dart:convert';
import 'dart:io';

import 'package:konstant_ui/src/constants.dart';
import 'package:konstant_ui/src/templates/component_template.dart';
import 'package:konstant_ui/utils/file_manager.dart';
import 'package:konstant_ui/utils/printer.dart';

void main(List<String> args) async {
  Printer.introMessage();

  final fileManager = FileManager();

  // Define the path to the implementation folder
  final implementationPath = "${Directory.current.path}/lib/impl";

  // Get a list of all files in the implementation folder
  final files = fileManager.getAllFiles(implementationPath);

  // Create templates from the files
  final templates = files.map((path) => createTemplate(path));

  // Convert the templates to JSON format
  final json = convertTemplatesToJson(templates);

  final content = "final templateMap = $json;";

  // Write the JSON content to a file
  fileManager.writeFile(
    path: Constants.templatesPath,
    content: content,
    force: true,
  );
}

/// Create a Template object from a file
ComponentTemplate createTemplate(String path) {
  final fileManager = FileManager();
  final templatePath = path.split("impl/")[1];
  final code = fileManager.readFile(path);

  return ComponentTemplate(path: templatePath, code: code);
}

/// Convert a list of templates to JSON format
String convertTemplatesToJson(Iterable<ComponentTemplate> templates) {
  final jsonMap = <String, String>{};

  for (var t in templates) {
    jsonMap[t.path] = t.code.codeUnits.toString();
  }

  return jsonEncode(jsonMap);
}
