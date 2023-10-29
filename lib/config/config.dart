import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:konstant_ui/utils/utils.dart';

part 'config.g.dart';

typedef ColorMap = Map<String, dynamic>;

@JsonSerializable()
class Config {
  final String path;

  final bool widgetbook;
  final StyleConfig? styles;
  final List<String> components;

  Config({
    this.path = "lib",
    this.styles,
    List<String>? components, // Change this to a nullable List
    this.widgetbook = true,
  }) : components = components ?? [];

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  /// Connect the generated [_$ConfigToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  static Config getConfig() {
    final file = getConfigFile();

    final Map<String, dynamic> json = jsonDecode(file.readAsStringSync());
    return Config.fromJson(json);
  }

  addComponent(String name) {
    if (!components.contains(name)) {
      components.add(name);
    }
  }

  write() {
    final file = getConfigFile();
    final config = _writePrepare();

    file.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(
      config.toJson(),
    ));
  }

  Config _writePrepare() {
    final paths = componentPaths();

    return Config(
      path: path,
      styles: styles,
      widgetbook: widgetbook,
      components: Set<String>.from(paths).toList()..sort(),
    );
  }

  List<String> componentPaths() => components
      .map((e) => e.replaceAll("$path/", ""))
      .map((e) => "$path/$e")
      .toList()
    ..sort();
}

@JsonSerializable()
class StyleConfig {
  final double inset;
  final ColorMap? colors;

  StyleConfig({this.inset = 8.0, this.colors});

  factory StyleConfig.fromJson(Map<String, dynamic> json) =>
      _$StyleConfigFromJson(json);

  Map<String, dynamic> toJson() => _$StyleConfigToJson(this);
}
