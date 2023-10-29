import 'dart:io';
import 'package:konstant_ui/config/config.dart';
import 'package:konstant_ui/src/constants.dart';
import 'package:konstant_ui/utils/printer.dart';

class DependencyManager {
  final Config config;
  final Map<String, bool> _dependencies = {};

  DependencyManager({required this.config}) {
    for (var path in config.components) {
      final exists = File(path).existsSync();

      final dep = path.replaceAll("${config.path}/", "");
      _dependencies[dep] = exists;
    }
  }

  printDeps({bool? resolved}) {
    final filteredDependencies = {
      for (var entry in _dependencies.entries)
        if (resolved == null || entry.value == resolved) entry.key: entry.value,
    };

    Printer.printJson(filteredDependencies);
  }

  List<String> getDependencies({bool? resolved}) {
    if (resolved == null) return _dependencies.keys.toList();
    return _dependencies.entries
        .where((entry) => entry.value == resolved)
        .map((entry) => entry.key)
        .toList();
  }

  void addDependency(String path) {
    final dep = path.replaceFirst(Constants.konstantUIImplPackageName, "");

    if (_dependencies.containsKey(dep) == false) {
      _dependencies[dep] = false;
    }
  }

  void addDependencies(Iterable<String> paths) {
    for (var path in paths) {
      addDependency(path);
    }
  }

  void resolveDependency(String path) {
    _dependencies[path] = true;
  }
}
