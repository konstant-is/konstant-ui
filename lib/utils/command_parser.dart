import 'dart:io';

import 'package:args/args.dart';
import 'package:konstant_ui/utils/printer.dart';

class Commands {
  static const String addCommand = "add";
  static const String initCommand = "init";
  static const String cleanCommand = "clean";
  static const String forceFlag = "force";
}

class CommandParser {
  final List<String> args;
  late ArgParser parser;
  late ArgResults _results;

  CommandParser({required this.args}) {
    parser = ArgParser();
    parser.addCommand(Commands.initCommand);
    parser.addCommand(Commands.addCommand);
    parser.addCommand(Commands.cleanCommand);

    parser.addFlag(
      Commands.forceFlag,
      // negatable: false,
      defaultsTo: false,
      abbr: 'f',
      help: 'Force the action',
    );

    if (args.isEmpty) {
      showHelp();
      exit(1);
    }

    try {
      _results = parser.parse(args);

      if (_results.command?.name == Commands.addCommand && args.length < 2) {
        throw Exception("Argument error: Need to add component");
      }
    } catch (e) {
      showHelp();
      exit(1); // Exit with an error code
    }
  }

  ArgResults get results => _results;

  String getComponentName() {
    final name = args[1];
    return name;
  }

  bool getFlag(String flag) => _results[flag] as bool;
}

void showHelp() {
  Printer.println('''

  usage:  dart run konstant_ui [command] [--force ] 

  commands: 
    - init: Initialize konstant ui
    - add [component]

  components:
    input: add input component        
    button: add button component

"
''');
}
