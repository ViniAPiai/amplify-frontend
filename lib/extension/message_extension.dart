import 'package:flutter/cupertino.dart';
import 'package:frontend/l10n/app_localizations.dart';

extension MessageExtension on BuildContext {

  String getMessage(String topic) {
    AppLocalizations t = AppLocalizations.of(this)!;
    switch(topic) {
      case "patientCreatedSuccessfully":
        return t.patientCreatedSuccessfully;
      case "patientCreatedByClinicSuccessfully":
        return t.patientCreatedByClinicSuccessfully;
      case "patientUpdatedSuccessfully":
        return t.patientUpdatedSuccessfully;
      case "patientUpdatedByClinicSuccessfully":
        return t.patientUpdatedByClinicSuccessfully;
      case "consultationScheduledSuccessfully":
        return t.consultationScheduledSuccessfully;
      case "consultationUpdatedSuccessfully":
        return t.consultationUpdatedSuccessfully;
      case "consultationDeletedSuccessfully":
        return t.consultationDeletedSuccessfully;
      case "consultationConfirmedSuccessfully":
        return t.consultationConfirmedSuccessfully;
      //Exceptions
      case "patientNotFoundException":
        return t.patientNotFoundException;
      case "patientUniqueEmailException":
        return t.patientUniqueEmailException;
      case "patientUniqueDocumentNumberException":
        return t.patientUniqueDocumentNumberException;
      case "patientNotBelongToClinicException":
        return t.patientNotBelongToClinicException;
      case "youAlreadyHaveAScheduledConsultationException":
        return t.youAlreadyHaveAScheduledConsultationException;
      case "patientAlreadyInClinicException":
        return t.patientAlreadyInClinicException;
      case "doctorNotBelongToClinicException":
        return t.doctorNotBelongToClinicException;
      case "consultationAlreadyIsFinishedException":
        return t.consultationAlreadyIsFinishedException;
      case "consultationIsCancelledException":
        return t.consultationIsCancelledException;
      default:
        return '';
    }
  }

}