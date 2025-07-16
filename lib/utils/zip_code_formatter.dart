import 'package:flutter/services.dart';

/// Class for the zip code formatter in the text form field
/// Brazil = 00000-000
/// Portugal = 0000-000
class ZipCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    String newText = '';
    int cursorPosition;

    if (digitsOnly.length <= 7) {
      digitsOnly = digitsOnly.substring(0, digitsOnly.length.clamp(0, 7));
      if (digitsOnly.length > 4) {
        newText = '${digitsOnly.substring(0, 4)}-${digitsOnly.substring(4)}';
      } else {
        newText = digitsOnly;
      }
    } else {
      digitsOnly = digitsOnly.substring(0, 8);
      if (digitsOnly.length > 5) {
        newText = '${digitsOnly.substring(0, 5)}-${digitsOnly.substring(5)}';
      } else {
        newText = digitsOnly;
      }
    }

    cursorPosition = newText.length;

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}