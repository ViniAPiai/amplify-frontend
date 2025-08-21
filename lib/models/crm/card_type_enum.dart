import 'package:flutter/cupertino.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:json_annotation/json_annotation.dart';

enum CardTypeEnum {
  @JsonValue("DEFAULT_TYPE")
  defaultType,
  @JsonValue("PATIENT_TYPE")
  patientType,
  @JsonValue("GET_IN_TOUCH_TYPE")
  getInTouchType;

  String getName(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    switch (this) {
      case CardTypeEnum.defaultType:
        return t.crmDefaultCardType;
      case CardTypeEnum.patientType:
        return t.crmRegisterPatientCardType;
      case CardTypeEnum.getInTouchType:
        return t.crmGetInTouchCardType;
    }
  }



}
