import 'dart:convert';
import 'dart:io';

import 'package:konstant_ui/src/templates/component_template.dart';
import 'package:konstant_ui/src/templates/styles_template.dart';
import 'package:konstant_ui/src/templates/widgetbook_template.dart';
import 'package:konstant_ui/utils/command_parser.dart';
import 'package:konstant_ui/config/config.dart';
import 'package:konstant_ui/src/constants.dart';
import 'package:konstant_ui/src/templates/template.dart';
import 'package:konstant_ui/src/templates.dart';
import 'package:konstant_ui/utils/dependency_manager.dart';
import 'package:konstant_ui/utils/file_manager.dart';
import 'package:konstant_ui/utils/printer.dart';
import 'package:konstant_ui/utils/utils.dart';

/// The main processor for KUI (Konstant UI) commands.
class KUICommandProcessor {
  final List<String> args;
  final CommandParser commandParser;
  final String? rootPath;
  final Config config;
  final DependencyManager dependencyManager;
  final FileManager fileManager;

  /// Constructs a [KUICommandProcessor] instance with the given arguments, configuration, and optional root path.
  KUICommandProcessor(
    this.args, {
    required this.config,
    required this.fileManager,
    this.rootPath,
  })  : commandParser = CommandParser(args: args),
        dependencyManager = DependencyManager(config: config);

  /// Processes the specified command, such as "add" or "init."
  void process() {
    Printer.introMessage();
    final command = commandParser.results.command;
    List<String> completeMessages = [];

    try {
      // Determine the command type (add or init)
      switch (command?.name) {
        case Commands.addCommand:
          Printer.runCommand("add ${commandParser.getComponentName()}");
          onAddCommand(); // Handle "add" command
          completeMessages.addAll(Constants.runWidgetbookMessage);
          break;
        case Commands.initCommand:
          Printer.runCommand("init");

          onInitCommand();
          if (config.widgetbook) {
            completeMessages.addAll(Constants.runWidgetbookMessage);
          }

          break;
        case Commands.cleanCommand:
          onCleanCommand();

          break;
        default:
          Printer.println("Unknown command: $command");
          break;
      }

      generateDependencies();

      Printer.addedFiles(config.componentPaths());
      config.write();
      Printer.completedMessage(completeMessages);
    } catch (e) {
      Printer.printError("Process error", e);
    }
  }

  /// Handles the "init" command, initializing templates and generating code.
  void onInitCommand() {
    final styles = config.styles ?? StyleConfig();
    List<String> scripts = [];

    final List<ComponentTemplate> componentTemplates = [
      createColorTemplate(Constants.styleFolder, styles.colors ?? {}),
      createInsetTemplate(Constants.styleFolder, baseInset: styles.inset),
      styleExportTemplate(Constants.styleFolder)
    ];

    final utils = templateMap.entries
        .where((entry) => entry.key.startsWith("utils/"))
        .map((e) {
      return Template(
        component: entryToComponent(e),
      );
    }).toList();

    if (config.widgetbook) {
      componentTemplates.addAll([
        createWidgetbookAppTemplate(Constants.widgetbookFolder),
        createWidgetbookComponents()
      ]);

      scripts.addAll([
        "flutter pub add widgetbook_annotation widgetbook lucide_icons",
        "flutter pub add widgetbook_generator build_runner --dev",
        "flutter clean",
        "flutter pub run build_runner build --delete-conflicting-outputs"
      ]);
    }

    final templates = [
      ...componentTemplates
          .map((component) => Template(component: component))
          .toList(),
      ...utils,
    ];

    writeTemplates(templates);
    runScripts(scripts);
  }

  void runScripts(List<String> scripts) {
    if (scripts.isEmpty) {
      return;
    }

    Printer.printnln();

    for (final script in scripts) {
      Printer.println("Running: $script");
      // Split the script into individual arguments
      final args = script.split(' ');

      // Run the script using Process.run
      final result = Process.runSync(args[0], args.sublist(1));

      if (result.exitCode != 0) {
        Printer.printError('Script failed:', script);
        Printer.printError("", result.stderr);
      }
    }
  }

  void onCleanCommand() {
    final components = config.components.toList();

    for (var path in components) {
      if (fileManager.deleteFile("lib/$path")) {
        config.components.remove(path);
      }
    }
  }

  /// Handles the "add" command, adding component templates and generating code.
  onAddCommand() {
    final componentCommand = commandParser.getComponentName();
    Iterable<MapEntry<String, String>> entries = [];
    if (componentCommand == "all") {
      entries = templateMap.entries;
    } else {
      entries = templateMap.entries.where(
          (entry) => entry.key.startsWith("components/ui/$componentCommand"));
    }

    // Parse templates from filtered entries
    final templates =
        entries.map((e) => Template(component: entryToComponent(e))).toList();

    // Write templates to files, generate dependencies, and update the config
    writeTemplates(templates);

    config.write();
  }

  /// Writes a list of templates to files and manages dependencies.
  void writeTemplates(List<Template> templates) {
    // Write template files, manage dependencies, and update the config

    for (var template in templates) {
      writeTemplateFile(template);

      dependencyManager.addDependencies(template.getKonstantUIDependencies());
      dependencyManager.resolveDependency(template.componentPath);
      config.addComponent(template.componentPath);
    }
  }

  /// Generates dependencies by recursively resolving unresolved dependencies.
  void generateDependencies() {
    final deps = dependencyManager.getDependencies(resolved: false);

    if (deps.isEmpty) {
      return;
    }
    final path = deps.first;

    final template = Template(
      component: entryToComponent(MapEntry(path, templateMap[path])),
    );

    // Write templates to files, generate dependencies, and update the config
    writeTemplates([template]);
    return generateDependencies();
  }

  void writeTemplateFile(Template template) {
    final force = commandParser.getFlag(Commands.forceFlag);

    final path =
        "${Directory.current.path}/${config.path}/${template.componentPath}";

    fileManager.writeFile(
      force: force,
      path: path,
      content: template.generateCode(
        packageName: getApplicationName(),
      ),
    );
  }
}

ComponentTemplate entryToComponent(MapEntry<String, dynamic> entry) {
  if (templateMap.containsKey(entry.key)) {
    final codeList = jsonDecode(templateMap[entry.key]!) as List;
    final template = ComponentTemplate(
      path: entry.key,
      code: utf8.decode(codeList.cast<int>()),
    );

    return template;
  }

  throw Exception("Could not parse template entry");
}
