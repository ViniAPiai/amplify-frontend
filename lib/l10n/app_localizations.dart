import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
    Locale('pt', 'BR')
  ];

  /// No description provided for @email.
  ///
  /// In pt, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @fullName.
  ///
  /// In pt, this message translates to:
  /// **'Nome Completo'**
  String get fullName;

  /// No description provided for @password.
  ///
  /// In pt, this message translates to:
  /// **'Senha'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar Senha'**
  String get confirmPassword;

  /// No description provided for @street.
  ///
  /// In pt, this message translates to:
  /// **'Rua'**
  String get street;

  /// No description provided for @number.
  ///
  /// In pt, this message translates to:
  /// **'Número'**
  String get number;

  /// No description provided for @complement.
  ///
  /// In pt, this message translates to:
  /// **'Complemento'**
  String get complement;

  /// No description provided for @neighborhood.
  ///
  /// In pt, this message translates to:
  /// **'Distrito'**
  String get neighborhood;

  /// No description provided for @city.
  ///
  /// In pt, this message translates to:
  /// **'Cidade'**
  String get city;

  /// No description provided for @state.
  ///
  /// In pt, this message translates to:
  /// **'Região'**
  String get state;

  /// No description provided for @zipCode.
  ///
  /// In pt, this message translates to:
  /// **'Código Postal'**
  String get zipCode;

  /// No description provided for @country.
  ///
  /// In pt, this message translates to:
  /// **'País'**
  String get country;

  /// No description provided for @gender.
  ///
  /// In pt, this message translates to:
  /// **'Gênero'**
  String get gender;

  /// No description provided for @birthDate.
  ///
  /// In pt, this message translates to:
  /// **'Data de Nascimento'**
  String get birthDate;

  /// No description provided for @phoneNumber.
  ///
  /// In pt, this message translates to:
  /// **'Telemóvel'**
  String get phoneNumber;

  /// No description provided for @healthNumber.
  ///
  /// In pt, this message translates to:
  /// **'Eteunte'**
  String get healthNumber;

  /// No description provided for @documentNumber.
  ///
  /// In pt, this message translates to:
  /// **'NIF'**
  String get documentNumber;

  /// No description provided for @nationalRegistry.
  ///
  /// In pt, this message translates to:
  /// **'Cartão Nacional de Identidade'**
  String get nationalRegistry;

  /// No description provided for @occupation.
  ///
  /// In pt, this message translates to:
  /// **'Ocupação'**
  String get occupation;

  /// No description provided for @isMandatory.
  ///
  /// In pt, this message translates to:
  /// **'é obrigatório'**
  String get isMandatory;

  /// No description provided for @quantity.
  ///
  /// In pt, this message translates to:
  /// **'{count, plural, =0 {Zero} =1 {Um} other {Mais de um }}'**
  String quantity(num count);

  /// No description provided for @validMustBeInformed.
  ///
  /// In pt, this message translates to:
  /// **'válido deve ser informado'**
  String get validMustBeInformed;

  /// No description provided for @passwordDoesNotMatch.
  ///
  /// In pt, this message translates to:
  /// **'As senhas não são iguais'**
  String get passwordDoesNotMatch;

  /// No description provided for @male.
  ///
  /// In pt, this message translates to:
  /// **'Masculino'**
  String get male;

  /// No description provided for @female.
  ///
  /// In pt, this message translates to:
  /// **'Feminino'**
  String get female;

  /// No description provided for @otherGender.
  ///
  /// In pt, this message translates to:
  /// **'Outro (a)'**
  String get otherGender;

  /// No description provided for @passwordLengthRule.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve ter ao menos 8 caracteres de comprimento'**
  String get passwordLengthRule;

  /// No description provided for @passwordSpecialCharacterRule.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve ter ao menos um caracter especial'**
  String get passwordSpecialCharacterRule;

  /// No description provided for @doNotHaveAccount.
  ///
  /// In pt, this message translates to:
  /// **'Não tem conta?'**
  String get doNotHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In pt, this message translates to:
  /// **'Cadastre-se'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get signIn;

  /// No description provided for @search.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisar'**
  String get search;

  /// No description provided for @searchPatientHint.
  ///
  /// In pt, this message translates to:
  /// **'NIF, E-mail, Nome ou Telemóvel'**
  String get searchPatientHint;

  /// No description provided for @newLabel.
  ///
  /// In pt, this message translates to:
  /// **'Novo'**
  String get newLabel;

  /// No description provided for @agenda.
  ///
  /// In pt, this message translates to:
  /// **'Agenda'**
  String get agenda;

  /// No description provided for @daily.
  ///
  /// In pt, this message translates to:
  /// **'Diário'**
  String get daily;

  /// No description provided for @weakly.
  ///
  /// In pt, this message translates to:
  /// **'Semanal'**
  String get weakly;

  /// No description provided for @monthly.
  ///
  /// In pt, this message translates to:
  /// **'Mensal'**
  String get monthly;

  /// No description provided for @to.
  ///
  /// In pt, this message translates to:
  /// **'até'**
  String get to;

  /// No description provided for @filter.
  ///
  /// In pt, this message translates to:
  /// **'Filtrar'**
  String get filter;

  /// No description provided for @patientList.
  ///
  /// In pt, this message translates to:
  /// **'Pacientes'**
  String get patientList;

  /// No description provided for @patientsLabel.
  ///
  /// In pt, this message translates to:
  /// **'pacientes'**
  String get patientsLabel;

  /// No description provided for @doctorLabel.
  ///
  /// In pt, this message translates to:
  /// **'Médico'**
  String get doctorLabel;

  /// No description provided for @descriptionLabel.
  ///
  /// In pt, this message translates to:
  /// **'Descrição'**
  String get descriptionLabel;

  /// No description provided for @sortBy.
  ///
  /// In pt, this message translates to:
  /// **'Ordenar por'**
  String get sortBy;

  /// No description provided for @basicInfo.
  ///
  /// In pt, this message translates to:
  /// **'Informações Básicas'**
  String get basicInfo;

  /// No description provided for @doctorsList.
  ///
  /// In pt, this message translates to:
  /// **'Médicos'**
  String get doctorsList;

  /// No description provided for @doctorsLabel.
  ///
  /// In pt, this message translates to:
  /// **'médicos'**
  String get doctorsLabel;

  /// No description provided for @medicalRecord.
  ///
  /// In pt, this message translates to:
  /// **'Registro Médico'**
  String get medicalRecord;

  /// No description provided for @hasDiabetes.
  ///
  /// In pt, this message translates to:
  /// **'Tem diabetes?'**
  String get hasDiabetes;

  /// No description provided for @hasHypertension.
  ///
  /// In pt, this message translates to:
  /// **'Tem hipertensão?'**
  String get hasHypertension;

  /// No description provided for @hasHeartProblems.
  ///
  /// In pt, this message translates to:
  /// **'Tem problemas cardíacos?'**
  String get hasHeartProblems;

  /// No description provided for @hasEpilepsy.
  ///
  /// In pt, this message translates to:
  /// **'Tem epilepsia?'**
  String get hasEpilepsy;

  /// No description provided for @hasAsthma.
  ///
  /// In pt, this message translates to:
  /// **'Tem asma?'**
  String get hasAsthma;

  /// No description provided for @hasOsteoporosis.
  ///
  /// In pt, this message translates to:
  /// **'Tem osteoporose?'**
  String get hasOsteoporosis;

  /// No description provided for @allergies.
  ///
  /// In pt, this message translates to:
  /// **'Alergias'**
  String get allergies;

  /// No description provided for @medications.
  ///
  /// In pt, this message translates to:
  /// **'Medicamentos'**
  String get medications;

  /// No description provided for @surgeries.
  ///
  /// In pt, this message translates to:
  /// **'Cirurgias'**
  String get surgeries;

  /// No description provided for @hasAnestheticAllergy.
  ///
  /// In pt, this message translates to:
  /// **'Tem alergia a anestésicos?'**
  String get hasAnestheticAllergy;

  /// No description provided for @hasBleedingIssues.
  ///
  /// In pt, this message translates to:
  /// **'Tem problemas de sangramento?'**
  String get hasBleedingIssues;

  /// No description provided for @isPregnant.
  ///
  /// In pt, this message translates to:
  /// **'Está grávida?'**
  String get isPregnant;

  /// No description provided for @pregnancyMonth.
  ///
  /// In pt, this message translates to:
  /// **'Mês da gravidez?'**
  String get pregnancyMonth;

  /// No description provided for @newPatient.
  ///
  /// In pt, this message translates to:
  /// **'Novo Paciente'**
  String get newPatient;

  /// No description provided for @updatePatient.
  ///
  /// In pt, this message translates to:
  /// **'Atualizar Paciente'**
  String get updatePatient;

  /// No description provided for @register.
  ///
  /// In pt, this message translates to:
  /// **'Cadastrar'**
  String get register;

  /// No description provided for @update.
  ///
  /// In pt, this message translates to:
  /// **'Atualizar'**
  String get update;

  /// No description provided for @edit.
  ///
  /// In pt, this message translates to:
  /// **'Editar'**
  String get edit;

  /// No description provided for @dateLabel.
  ///
  /// In pt, this message translates to:
  /// **'Data'**
  String get dateLabel;

  /// No description provided for @beginTimeLabel.
  ///
  /// In pt, this message translates to:
  /// **'Início'**
  String get beginTimeLabel;

  /// No description provided for @endTimeLabel.
  ///
  /// In pt, this message translates to:
  /// **'Término'**
  String get endTimeLabel;

  /// No description provided for @yes.
  ///
  /// In pt, this message translates to:
  /// **'Sim'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In pt, this message translates to:
  /// **'Não'**
  String get no;

  /// No description provided for @okay.
  ///
  /// In pt, this message translates to:
  /// **'Ok'**
  String get okay;

  /// No description provided for @cancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @next.
  ///
  /// In pt, this message translates to:
  /// **'Próximo'**
  String get next;

  /// No description provided for @newAppointment.
  ///
  /// In pt, this message translates to:
  /// **'Nova Consulta'**
  String get newAppointment;

  /// No description provided for @datesAndTimes.
  ///
  /// In pt, this message translates to:
  /// **'Datas e horários'**
  String get datesAndTimes;

  /// No description provided for @addDate.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar Data'**
  String get addDate;

  /// No description provided for @procedures.
  ///
  /// In pt, this message translates to:
  /// **'Procedimentos'**
  String get procedures;

  /// No description provided for @appointmentType.
  ///
  /// In pt, this message translates to:
  /// **'Tipo de consulta'**
  String get appointmentType;

  /// No description provided for @teeth.
  ///
  /// In pt, this message translates to:
  /// **'Dentes'**
  String get teeth;

  /// No description provided for @basicInformation.
  ///
  /// In pt, this message translates to:
  /// **'Informações Básicas'**
  String get basicInformation;

  /// No description provided for @address.
  ///
  /// In pt, this message translates to:
  /// **'Endereço'**
  String get address;

  /// No description provided for @personalInformation.
  ///
  /// In pt, this message translates to:
  /// **'Informações Pessoais'**
  String get personalInformation;

  /// No description provided for @brazil.
  ///
  /// In pt, this message translates to:
  /// **'Brasil'**
  String get brazil;

  /// No description provided for @portugal.
  ///
  /// In pt, this message translates to:
  /// **'Portugal'**
  String get portugal;

  /// No description provided for @thePatientRequestedAnConsultation.
  ///
  /// In pt, this message translates to:
  /// **'O paciente {name} solicitou uma consulta, confirmar?'**
  String thePatientRequestedAnConsultation(Object name);

  /// No description provided for @patientCreatedSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Paciente criado com sucesso'**
  String get patientCreatedSuccessfully;

  /// No description provided for @patientCreatedByClinicSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Paciente criado pela clínica com sucesso'**
  String get patientCreatedByClinicSuccessfully;

  /// No description provided for @patientUpdatedSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Paciente atualizado com sucesso'**
  String get patientUpdatedSuccessfully;

  /// No description provided for @patientUpdatedByClinicSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Paciente atualizado pela clínica com sucesso'**
  String get patientUpdatedByClinicSuccessfully;

  /// No description provided for @consultationScheduledSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Consulta agendada com sucesso'**
  String get consultationScheduledSuccessfully;

  /// No description provided for @consultationUpdatedSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Consulta atualizada com sucesso'**
  String get consultationUpdatedSuccessfully;

  /// No description provided for @consultationDeletedSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Consulta deletada com sucesso'**
  String get consultationDeletedSuccessfully;

  /// No description provided for @consultationConfirmedSuccessfully.
  ///
  /// In pt, this message translates to:
  /// **'Consulta confirmada com sucesso'**
  String get consultationConfirmedSuccessfully;

  /// No description provided for @patientNotFoundException.
  ///
  /// In pt, this message translates to:
  /// **'Paciente não encontrado'**
  String get patientNotFoundException;

  /// No description provided for @patientUniqueEmailException.
  ///
  /// In pt, this message translates to:
  /// **'Paciente já existe com este email'**
  String get patientUniqueEmailException;

  /// No description provided for @patientUniqueDocumentNumberException.
  ///
  /// In pt, this message translates to:
  /// **'Paciente já existe com este NIF'**
  String get patientUniqueDocumentNumberException;

  /// No description provided for @patientNotBelongToClinicException.
  ///
  /// In pt, this message translates to:
  /// **'Paciente não pertence à clínica'**
  String get patientNotBelongToClinicException;

  /// No description provided for @youAlreadyHaveAScheduledConsultationException.
  ///
  /// In pt, this message translates to:
  /// **'Você já tem uma consulta agendada'**
  String get youAlreadyHaveAScheduledConsultationException;

  /// No description provided for @patientAlreadyInClinicException.
  ///
  /// In pt, this message translates to:
  /// **'Paciente já está na clínica, não pode ser atualizado'**
  String get patientAlreadyInClinicException;

  /// No description provided for @doctorNotBelongToClinicException.
  ///
  /// In pt, this message translates to:
  /// **'Médico não pertence à clínica'**
  String get doctorNotBelongToClinicException;

  /// No description provided for @consultationAlreadyIsFinishedException.
  ///
  /// In pt, this message translates to:
  /// **'Consulta já está finalizada, não pode ser atualizado ou deletado'**
  String get consultationAlreadyIsFinishedException;

  /// No description provided for @consultationIsCancelledException.
  ///
  /// In pt, this message translates to:
  /// **'Consulta está cancelada, não pode ser atualizado ou deletado'**
  String get consultationIsCancelledException;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
