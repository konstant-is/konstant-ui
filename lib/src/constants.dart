class Constants {
  static const String configName = "konstant_ui.json";

  static const String konstantUIPackageName = "app";
  static const String konstantUIImplPackageName = "app/";

  static const String templatesPath = "lib/src/templates.dart";

  static const String widgetbook = "widgetbook";

  static const styleFolder = "styles";
  static const utilsFolder = "utils";
  static const widgetbookFolder = "widgetbook";

  static List<String> runWidgetbookMessage = [
    "Build widgetbook:",
    "- dart run build_runner build --delete-conflicting-outputs",
    "- dart run build_runner watch",
    "",
    "Run widgetbook with platform [chrome, macos, windows, linux]:",
    " - flutter run -d [plaftform] -t lib/widgetbook/widgetbook_app.dart",
  ];
}
