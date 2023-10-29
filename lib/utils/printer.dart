import 'dart:convert';

class Printer {
  static void println(String message) => print(message);
  static void printnln() => print("");

  static void printError(String message, dynamic e) => print("$message $e");
  static void printJson(Object obj) =>
      print(const JsonEncoder.withIndent('  ').convert(obj));

  static runCommand(String command) => println("Running: konstant_ui $command");

  static void introMessage() => println('''
════════════════════════════════════════════
     Konstant UI (v1.0.0)
════════════════════════════════════════════
  ''');

  static void completedMessage([List<String> messages = const []]) =>
      println('''

════════════════════════════════════════════
     Konstant UI Completed
════════════════════════════════════════════

${messages.join("\n")}
''');

  static void addedFiles(List<String> files) {
    final title = files.isEmpty ? "No files added" : "";

    println(title);
    for (var dep in files) {
      Printer.println(" - $dep");
    }
  }
}
