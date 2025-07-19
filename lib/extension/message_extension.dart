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
      case "appointmentScheduledSuccessfully":
        return t.appointmentScheduledSuccessfully;
      case "appointmentUpdatedSuccessfully":
        return t.appointmentUpdatedSuccessfully;
      case "appointmentDeletedSuccessfully":
        return t.appointmentDeletedSuccessfully;
      case "appointmentConfirmedSuccessfully":
        return t.appointmentConfirmedSuccessfully;
      //Exceptions
      case "patientNotFoundException":
        return t.patientNotFoundException;
      case "patientUniqueEmailException":
        return t.patientUniqueEmailException;
      case "patientUniqueDocumentNumberException":
        return t.patientUniqueDocumentNumberException;
      case "patientNotBelongToClinicException":
        return t.patientNotBelongToClinicException;
      case "youAlreadyHaveAScheduledAppointmentException":
        return t.youAlreadyHaveAScheduledAppointmentException;
      case "patientAlreadyInClinicException":
        return t.patientAlreadyInClinicException;
      case "doctorNotBelongToClinicException":
        return t.doctorNotBelongToClinicException;
      case "appointmentAlreadyIsFinishedException":
        return t.appointmentAlreadyIsFinishedException;
      case "appointmentIsCancelledException":
        return t.appointmentIsCancelledException;
      case "emailOrPasswordIsIncorrectException":
        return t.emailOrPasswordIsIncorrectException;
      case "accountIsLockedException":
        return t.accountIsLockedException;
      case "youAreNotAuthorizedToThisResourceException":
        return t.youAreNotAuthorizedToThisResourceException;
      case "sessionNonValidException":
        return t.sessionNonValidException;
      case "sessionExpiredException":
        return t.sessionExpiredException;
      case "unknownErrorException":
        return t.unknownErrorException;
      default:
        return '';
    }
  }

}