class StringBufferUtils {
  final StringBuffer _stringBuffer = StringBuffer();
  String get serializeStringBuffer {
    return _stringBuffer.toString();
  }

  /// Writes a line of text into the current [StringBuffer] and adds a space new line after it
  void writeln(
    String obj, {
    int padding = 0,
    int preLines = 0,
    int postlines = 0,
  }) {
    List.generate(preLines, (_) => newLine());
    _stringBuffer.writeln(obj.padLeft(padding));
    List.generate(postlines, (_) => newLine());
  }

  /// Adds a new line after what was written before this
  void newLine() => _stringBuffer.writeln();

  /// Sorts the imports and then writed it to the current [StringBuffer]
  void sortAndWriteImports(Iterable<String> imports) {
    var sorted = imports.toList()..sort();
    for (var import in sorted) {
      writeln("import '$import';");
    }
  }

  // /// Write the import statements for the given [imports].
  void writeImports(Set<String> imports) {
    final validImports = imports.toSet();
    final dartImports =
        validImports.where((element) => element.startsWith('dart')).toSet();
    sortAndWriteImports(dartImports);
    newLine();

    // final packageImports =
    //     validImports.where((element) => element.startsWith('package')).toSet();
    // packageImports.addAll(validationFileImports);
    // sortAndGenerate(packageImports);
    newLine();

    final rest = validImports.difference({
      ...dartImports,
      // ...packageImports,
    });
    sortAndWriteImports(rest);
    newLine();
  }

  void generateIterableWithPaddingLines(Iterable<String> imports,
      {int preLines = 0, int postlines = 0}) {
    List.generate(preLines, (_) => newLine());
    for (var import in imports) {
      writeln("import '$import';");
    }
    List.generate(postlines, (_) => newLine());
  }

  bool isNull(String? value) => value == null || value == 'null';
}
