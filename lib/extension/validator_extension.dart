import 'package:flutter/cupertino.dart';

extension ValidatorExtension on BuildContext {
  RegExp getPostalCodeValidator(String country) {
    if (country == 'Portugal') {
      return RegExp(r'^\d{4}-\d{3}$');
    } else if (country == 'Brasil') {
      return RegExp(r'^\d{5}-?\d{3}$');
    }
    return RegExp(r'^\d{4}-\d{3}$');
  }

  RegExp phoneValidator(String country) {
    final regexBrazil = RegExp(r'^\(?[1-9]{2}\)? ?9[0-9]{4}-?[0-9]{4}$');
    final regexPortugal = RegExp(r'^9\d{2} ?\d{3} ?\d{3}$');
    if (country == "Brasil") {
      return regexBrazil;
    } else if (country == "Portugal") {
      return regexPortugal;
    }
    return regexPortugal;
  }

  RegExp documentNumberValidator(String country) {
    RegExp brazil = RegExp(r'^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$');
    RegExp portugal = RegExp(r'^\d{9}$');
    if (country == 'Portugal') {
      return portugal;
    } else if (country == 'Brasil') {
      return brazil;
    }
    return portugal;
  }

  RegExp healthNumberValidator(String country) {
    final RegExp brazil = RegExp(r'^\d{15}$');
    final RegExp portugal = RegExp(r'^\d{9}$');
    if (country == 'Portugal') {
      return portugal;
    } else if (country == 'Brasil') {
      return brazil;
    }
    return portugal;
  }

}
