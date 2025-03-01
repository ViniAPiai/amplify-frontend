
import 'package:flutter/cupertino.dart';

extension HintExtension on BuildContext {

  String getPostalCodeHint(String country) {
    if (country == 'Portugal') {
      return "1234-567";
    } else if (country == 'Brasil') {
      return "12345-678";
    }
    return "1234-567";
  }

}