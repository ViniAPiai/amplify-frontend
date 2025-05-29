
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

extension LocaleExtension on BuildContext {
  Locale get locale => Localizations.localeOf(this);

  String get languageCode => locale.languageCode; // Ex: "pt"
  String? get countryCode => locale.countryCode; // Ex: "BR"

  PatternValidator validatorPostalCode(String? country) {
    String cc = countryCode ?? 'PT';
    if(country != null) {
      if(country == 'BR') {
        cc = 'BR';
      }else if(country == 'PT') {
        cc = 'PT';
      }else if(country == 'US') {
        cc = 'EN';
      }else{
        cc = 'PT';
      }
    }
    switch(cc) {
      case 'PT':
        return PatternValidator(RegExp(r'^\d{4}-\d{3}$'), errorText: "Um Código Postal válido deve ser informado");
      case 'BR':
        return PatternValidator(RegExp(r'^\d{5}-?\d{3}$'), errorText: "Um Código Postal válido deve ser informado");
      default:
        return PatternValidator(RegExp(r'^\d{4}-\d{3}$'), errorText: "Um Código Postal válido deve ser informado");
    }
  }



}