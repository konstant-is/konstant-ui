import 'dart:io';

import 'package:konstant_ui/src/constants.dart';
import 'package:konstant_ui/utils/printer.dart';

File getConfigFile() {
  try {
    final File configFile = File(Constants.configName);

    if (!configFile.existsSync()) {
      throw Exception("Configuration file not found.");
    }

    return configFile;
  } catch (e) {
    Printer.printError('Error getting configuration:', e);
    rethrow; // Re-throw the error for handling at a higher level
  }
}

String extractPathFromImport(String import, String package) {
  if (import.contains(package)) {
    return import
        .replaceAll('\n', '')
        .replaceFirst("import '$package/", "")
        .replaceFirst("';", "");
  }
  return import;
}

String removePackagePrefix(String import) {
  return import.replaceFirst("package:", "");
}

/// Return the name of the application
String getApplicationName() {
  // Get the script's path, which includes the Dart script file name
  return Directory.current.path.split("/").last;
}

extension StringUtilsExtension on String {
  RegExpMatch? get getTypeInsideList =>
      RegExp(r'(.*)<(.*)(>)').firstMatch(this);

  String get toLowerCamelCase {
    if (length < 2) return toLowerCase();
    return this[0].toLowerCase() + substring(1);
  }

  String get capitalize {
    if (length < 2) return toUpperCase();
    return this[0].toUpperCase() + substring(1);
  }

  String get toKababCase {
    return replaceAllMapped(RegExp('(.+?)([A-Z])'),
        (match) => '${match.group(1)}-${match.group(2)}'.toLowerCase());
  }
}
