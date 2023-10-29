import 'package:flutter/services.dart';

class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    int prevLen = oldValue.text.length;
    int nextLen = newValue.text.length;

    bool isAdding = nextLen > prevLen;
    final StringBuffer result = StringBuffer();

    if (isAdding) {
      final numberLen = newValue.text.split(":").join().length;
      // only allow 10 characters
      if (numberLen > 4) {
        return TextEditingValue(
          text: oldValue.text,
          selection: TextSelection.collapsed(offset: oldValue.text.length),
        );
      }

      if (nextLen == 3) {
        final newChar = newValue.text.substring(nextLen - 1, nextLen);
        result.write("${oldValue.text.trim()}:$newChar");
      } else {
        result.write(newValue.text.trim());
      }

      return TextEditingValue(
        text: result.toString(),
        selection: TextSelection.collapsed(offset: result.length),
      );
    }

    result.write(newValue.text.trim());

    return TextEditingValue(
      text: result.toString(),
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}

final NumberFormatter = FilteringTextInputFormatter.digitsOnly;
