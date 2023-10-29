import 'dart:io';

import 'package:konstant_ui/utils/printer.dart';

class FileManager {
  Directory get currentDir => Directory.current;

  /// Write content to a file
  bool writeFile({
    required String path,
    required String content,
    bool force = false,
  }) {
    // Extract the directory path from the full path
    final directory = Directory(path.substring(0, path.lastIndexOf('/')));

    if (fileExistsSync(path) && !force) {
      return false;
    }

    try {
      // Create the directory if it doesn't exist
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
      }

      final file = File(path);

      file.writeAsStringSync(content);
      return true;
    } catch (e) {
      Printer.printError('Failed to create directory:', directory.path);

      return false;
    }
  }

  bool fileExistsSync(String path) => File(path).existsSync();

  /// Read the content of a file
  String readFile(String path) {
    final file = File(path);
    final content = file.readAsStringSync();

    return content;
  }

  bool deleteFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      return false;
    }
    try {
      // Delete the file
      file.deleteSync();
      return true;
    } catch (e) {
      Printer.printError('Error deleting file:', e);
    }

    return false;
  }

  /// Get a list of all files in the specified directory and its subdirectories
  List<String> getAllFiles(String path) {
    final List<String> files = [];
    final dir = Directory(path);

    readDirectory(dir, files);

    return files;
  }

  /// Recursively read files in a directory and its subdirectories
  void readDirectory(Directory dir, List<String> files) {
    final lister = dir.listSync();

    for (var fileOrDir in lister) {
      if (fileOrDir is File) {
        final name = getFileName(fileOrDir.path);
        Printer.println('File: $name');
        files.add(fileOrDir.path);
      } else if (fileOrDir is Directory) {
        Printer.println('Directory: ${fileOrDir.path}');
        readDirectory(fileOrDir, files);
      }
    }
    Printer.printnln();
  }

  /// Get the name of a file from its path
  String getFileName(String path) {
    return path.split("/").last;
  }
}
