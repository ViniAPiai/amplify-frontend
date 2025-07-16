import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  static const _prefixPortugal = '+351 ';
  static const _prefixBrazil = '+55 ';

  final String country;

  PhoneNumberFormatter({required this.country});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String raw = newValue.text;
    String digits = raw.replaceAll(RegExp(r'\D'), '');

    String formatted = '';
    int offset;

    if ((raw.startsWith('+351') || digits.startsWith('351')) && country == "portugal") {
      digits = digits.replaceFirst(RegExp(r'^351'), '');
      if (digits.length > 9) digits = digits.substring(0, 9);

      final buffer = StringBuffer(_prefixPortugal);
      for (int i = 0; i < digits.length; i++) {
        if (i == 3 || i == 6) buffer.write(' ');
        buffer.write(digits[i]);
      }

      formatted = buffer.toString();
    } else if ((raw.startsWith('+55') || digits.startsWith('55')) && country == "brazil") {
      digits = digits.replaceFirst(RegExp(r'^55'), '');
      if (digits.length > 11) digits = digits.substring(0, 11);

      final buffer = StringBuffer(_prefixBrazil);
      for (int i = 0; i < digits.length; i++) {
        if (i == 0) buffer.write('(');
        if (i == 2) buffer.write(') ');
        if (i == 7) buffer.write('-');
        buffer.write(digits[i]);
      }

      formatted = buffer.toString();
    } else {
      if (digits.length > 11) digits = digits.substring(0, 11);

      final buffer = StringBuffer();
      for (int i = 0; i < digits.length; i++) {
        if (i == 0) buffer.write('(');
        if (i == 2) buffer.write(') ');
        if (i == 7) buffer.write('-');
        buffer.write(digits[i]);
      }

      formatted = buffer.toString();
    }

    offset = formatted.length;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: offset),
    );
  }
}
