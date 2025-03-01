import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension MaskFormatterExtension on BuildContext {

  MaskTextInputFormatter getZipCodeFormatter(String country) {
    if (country == 'Portugal') {
      return MaskTextInputFormatter(
        mask: '####-###',
        filter: {"#": RegExp(r'[0-9]')},
      );
    } else if (country == 'Brasil') {
      return MaskTextInputFormatter(
        mask: '#####-###',
        filter: {"#": RegExp(r'[0-9]')},
      );
    }
    return MaskTextInputFormatter(
      mask: '####-###',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  MaskTextInputFormatter phoneFormatter(String country) {
    if (country == 'Portugal') {
      return MaskTextInputFormatter(
        mask: '9## ### ###',
        filter: {"#": RegExp(r'[0-9]')},
      );
    } else if (country == 'Brasil') {
      return MaskTextInputFormatter(
        mask: '(##) 9####-####',
        filter: {"#": RegExp(r'[0-9]')},
      );
    }
    return MaskTextInputFormatter(
      mask: '9## ### ###',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  MaskTextInputFormatter documentNumberFormatter(String country) {
    if (country == 'Brasil') {
      return MaskTextInputFormatter(
        mask: '###.###.###-##',
        filter: {"#": RegExp(r'[0-9]')},
      );
    } else if (country == 'Portugal') {
      return MaskTextInputFormatter(
        mask: '#########',
        filter: {"#": RegExp(r'[0-9]')},
      );
    }
    return MaskTextInputFormatter(
      mask: '#########',
      filter: {"#": RegExp(r'[0-9]')},
    );
  }

  MaskTextInputFormatter healthNumberFormatter(String country) {
    MaskTextInputFormatter brazil = MaskTextInputFormatter(
      mask: '################',
      filter: {"#": RegExp(r'[0-9]')},
    );
    MaskTextInputFormatter portugal = MaskTextInputFormatter(
      mask: '#########',
      filter: {"#": RegExp(r'[0-9]')},
    );
    if (country == 'Brasil') {
      return brazil;
    } else if (country == 'Portugal') {
      return portugal;
    }
    return portugal;
  }

}
