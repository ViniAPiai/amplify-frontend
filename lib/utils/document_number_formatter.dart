

import 'package:flutter/services.dart';

class DocumentNumberFormatter extends TextInputFormatter {

  final String country;

  DocumentNumberFormatter({required this.country});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    String newText;
    int cursorPosition;

    if (digitsOnly.length <= 9 && country == "portugal") {
      newText = digitsOnly;
      cursorPosition = newText.length;
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPosition),
      );
      // if (digitsOnly.length <= 11 && country == "brazil")
    } else  {
      final buffer = StringBuffer();
      for (int i = 0; i < digitsOnly.length && i < 11; i++) {
        if (i == 3 || i == 6) buffer.write('.');
        if (i == 9) buffer.write('-');
        buffer.write(digitsOnly[i]);
      }
      newText = buffer.toString();
      cursorPosition = newText.length;
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: cursorPosition),
      );
    }
  }
}
