import 'package:konstant_ui/config/config.dart';
import 'package:konstant_ui/kui_processor.dart';
import 'package:konstant_ui/utils/file_manager.dart';

void main(List<String> args) {
  final commandProcessor = KUICommandProcessor(
    args,
    config: Config.getConfig(),
    fileManager: FileManager(),
  );
  commandProcessor.process();
}
