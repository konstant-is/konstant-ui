import 'dart:io';
import 'package:konstant_ui/utils/file_manager.dart';
import 'package:test/test.dart';

void main() {
  group('FileManager', () {
    late FileManager fileManager;
    late Directory tempDir;
    late Directory readOnlyDir;

    setUp(() {
      fileManager = FileManager();
      tempDir = Directory.systemTemp.createTempSync();
      readOnlyDir = Directory('${tempDir.path}/read_only_directory');
      readOnlyDir.createSync();
      final fileInReadOnlyDir = File('${readOnlyDir.path}/read_only_file.txt');
      fileInReadOnlyDir.createSync();
    });

    test('writeFile creates a file', () {
      final filePath = '${tempDir.path}/test_file.txt';
      const content = 'Test file content';

      final success = fileManager.writeFile(path: filePath, content: content);

      final file = File(filePath);
      expect(success, isTrue);
      expect(file.existsSync(), isTrue);
      expect(file.readAsStringSync(), equals(content));
    });

    test('writeFile does not overwrite an existing file when force is false',
        () {
      final filePath = '${tempDir.path}/existing_file.txt';
      const existingContent = 'Existing file content';
      File(filePath).writeAsStringSync(existingContent);

      const newContent = 'New content';

      final success = fileManager.writeFile(
          path: filePath, content: newContent, force: false);

      final file = File(filePath);
      expect(success, isFalse); // Writing should fail
      expect(file.readAsStringSync(),
          equals(existingContent)); // File content should remain unchanged
    });

    test('writeFile overwrites an existing file when force is true', () {
      final filePath = '${tempDir.path}/existing_file.txt';
      const existingContent = 'Existing file content';
      File(filePath).writeAsStringSync(existingContent);

      const newContent = 'New content';

      final success = fileManager.writeFile(
          path: filePath, content: newContent, force: true);

      final file = File(filePath);
      expect(success, isTrue); // Writing should succeed
      expect(file.readAsStringSync(),
          equals(newContent)); // File content should be updated
    });

    test('fileExistsSync returns true for an existing file', () {
      final filePath = '${tempDir.path}/existing_file.txt';
      const content = 'Existing file content';
      File(filePath).writeAsStringSync(content);

      final exists = fileManager.fileExistsSync(filePath);
      expect(exists, isTrue);
    });

    test('fileExistsSync returns false for a non-existing file', () {
      final nonExistingFilePath = '${tempDir.path}/non_existing_file.txt';
      final exists = fileManager.fileExistsSync(nonExistingFilePath);
      expect(exists, isFalse);
    });

    test('readFile returns file content', () {
      final filePath = '${tempDir.path}/read_file.txt';
      const content = 'Read file content';
      File(filePath).writeAsStringSync(content);

      final fileContent = fileManager.readFile(filePath);
      expect(fileContent, equals(content));
    });

    test('deleteFile deletes a file', () {
      final filePath = '${tempDir.path}/file_to_delete.txt';
      const content = 'File to delete content';
      File(filePath).writeAsStringSync(content);

      final deleted = fileManager.deleteFile(filePath);
      expect(deleted, isTrue);
      final file = File(filePath);
      expect(file.existsSync(), isFalse);
    });

    test('deleteFile returns false for a non-existing file', () {
      final nonExistingFilePath = '${tempDir.path}/non_existing_file.txt';
      final deleted = fileManager.deleteFile(nonExistingFilePath);
      expect(deleted, isFalse);
    });

    // Clean up the temporary directory after testing
    tearDown(() {
      tempDir.deleteSync(recursive: true);
    });
  });
}
