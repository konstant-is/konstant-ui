import 'package:konstant_ui/config/config.dart';
import 'package:konstant_ui/kui_processor.dart';
import 'package:konstant_ui/utils/file_manager.dart';

void main(List<String> args) {
  final commandProcessor = KUICommandProcessor(
    args,
    config: getOrCreateConfig(),
    fileManager: FileManager(),
  );
  commandProcessor.process();
}

Config getOrCreateConfig() {
  try {
    return Config.getConfig();
  } catch (e) {
    return Config();
  }
}
