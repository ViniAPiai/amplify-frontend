// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get email => 'Email';

  @override
  String get fullName => 'Full Name';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get street => 'Street';

  @override
  String get number => 'Number';

  @override
  String get complement => 'Complement';

  @override
  String get district => 'District';

  @override
  String get city => 'City';

  @override
  String get state => 'State';

  @override
  String get zipCode => 'Zip Code';

  @override
  String get country => 'Country';

  @override
  String get gender => 'Gender';

  @override
  String get birthDate => 'Birth Date';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get healthNumber => 'Health Number';

  @override
  String get documentNumber => 'NINo';

  @override
  String get documentNumberExpirationDate => 'Document Number Expiration Date';

  @override
  String get occupation => 'Occupation';

  @override
  String get isMandatory => 'is mandatory';

  @override
  String quantity(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'More than one ',
      one: 'One',
      zero: 'None',
    );
    return '$_temp0';
  }

  @override
  String get validMustBeInformed => 'valid must be informed';

  @override
  String get passwordDoesNotMatch => 'Passwords do not match';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get otherGender => 'Other';

  @override
  String get passwordLengthRule =>
      'Password must have at least 8 characters length';

  @override
  String get passwordSpecialCharacterRule =>
      'Password must have at least one special character';

  @override
  String get doNotHaveAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign Up';

  @override
  String get signIn => 'Sign In';

  @override
  String get search => 'Search';

  @override
  String get searchPatientHint => 'NINo, E-mail, Name or Phone Number';

  @override
  String get newLabel => 'New';

  @override
  String get agenda => 'Agenda';

  @override
  String get daily => 'Daily';

  @override
  String get weakly => 'Weakly';

  @override
  String get monthly => 'Monthly';

  @override
  String get to => 'to';

  @override
  String get filter => 'Filter';

  @override
  String get patientList => 'Patients';

  @override
  String get patientsLabel => 'patients';

  @override
  String get doctorLabel => 'Doctor';

  @override
  String get descriptionLabel => 'Description';

  @override
  String get sortBy => 'Sort by';

  @override
  String get basicInfo => 'Basic Information';

  @override
  String get doctorsList => 'Doctors';

  @override
  String get doctorsLabel => 'doctors';

  @override
  String get medicalRecord => 'Medical Record';

  @override
  String get hasDiabetes => 'Has Diabetes';

  @override
  String get hasHypertension => 'Has Hypertension';

  @override
  String get hasHeartProblems => 'Has HeartProblems';

  @override
  String get hasEpilepsy => 'Has Epilepsy';

  @override
  String get hasAsthma => 'Has Asthma';

  @override
  String get hasOsteoporosis => 'Has Osteoporosis';

  @override
  String get allergies => 'Allergies';

  @override
  String get medications => 'Medications';

  @override
  String get surgeries => 'Surgeries';

  @override
  String get hasAnestheticAllergy => 'Has AnestheticAllergy';

  @override
  String get hasBleedingIssues => 'Has BleedingIssues';

  @override
  String get isPregnant => 'Is Pregnant';

  @override
  String get pregnancyMonth => 'Pregnancy Month';

  @override
  String get newPatient => 'New Patient';

  @override
  String get register => 'Register';

  @override
  String get edit => 'Edit';

  @override
  String get dateLabel => 'Date';

  @override
  String get beginTimeLabel => 'Begin';

  @override
  String get endTimeLabel => 'End';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get okay => 'Okay';

  @override
  String get cancel => 'Cancel';

  @override
  String get newAppointment => 'New Appointment';

  @override
  String get datesAndTimes => 'Dates and Times';

  @override
  String get addDate => 'Add Date';

  @override
  String get procedures => 'Procedures';

  @override
  String get appointmentType => 'Appointment Type';

  @override
  String get teeth => 'Teeth';

  @override
  String thePatientRequestedAnConsultation(Object name) {
    return 'The patient $name requested an consultation, confirm?';
  }

  @override
  String get patientCreatedSuccessfully => 'Patient created successfully';

  @override
  String get patientCreatedByClinicSuccessfully =>
      'Patient created by clinic successfully';

  @override
  String get patientUpdatedSuccessfully => 'Patient updated successfully';

  @override
  String get patientUpdatedByClinicSuccessfully =>
      'Patient updated by clinic successfully';

  @override
  String get consultationScheduledSuccessfully =>
      'Consultation scheduled successfully';

  @override
  String get consultationUpdatedSuccessfully =>
      'Consultation updated successfully';

  @override
  String get consultationDeletedSuccessfully =>
      'Consultation deleted successfully';

  @override
  String get consultationConfirmedSuccessfully =>
      'Consultation confirmed successfully';

  @override
  String get patientNotFoundException => 'Patient not found';

  @override
  String get patientUniqueEmailException =>
      'Patient already exists with this email';

  @override
  String get patientUniqueDocumentNumberException =>
      'Patient already exists with this document number';

  @override
  String get patientNotBelongToClinicException =>
      'Patient not belongs to clinic';

  @override
  String get youAlreadyHaveAScheduledConsultationException =>
      'You already have a scheduled consultation';

  @override
  String get patientAlreadyInClinicException =>
      'Patient already in clinic, cannot be updated';

  @override
  String get doctorNotBelongToClinicException => 'Doctor not belongs to clinic';

  @override
  String get consultationAlreadyIsFinishedException =>
      'Consultation already is finished, cannot be updated or deleted';

  @override
  String get consultationIsCancelledException =>
      'Consultation is cancelled, cannot be updated or deleted';
}
