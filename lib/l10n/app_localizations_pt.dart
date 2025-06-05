// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get email => 'Email';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get password => 'Senha';

  @override
  String get confirmPassword => 'Confirmar Senha';

  @override
  String get street => 'Rua';

  @override
  String get number => 'Número';

  @override
  String get complement => 'Complemento';

  @override
  String get district => 'Distrito';

  @override
  String get city => 'Cidade';

  @override
  String get state => 'Região';

  @override
  String get zipCode => 'Código Postal';

  @override
  String get country => 'País';

  @override
  String get gender => 'Gênero';

  @override
  String get birthDate => 'Data de Nascimento';

  @override
  String get phoneNumber => 'Telemóvel';

  @override
  String get healthNumber => 'Eteunte';

  @override
  String get documentNumber => 'NIF';

  @override
  String get documentNumberExpirationDate => 'Data de Validade do NIF';

  @override
  String get occupation => 'Ocupação';

  @override
  String get isMandatory => 'é obrigatório';

  @override
  String quantity(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mais de um ',
      one: 'Um',
      zero: 'Zero',
    );
    return '$_temp0';
  }

  @override
  String get validMustBeInformed => 'válido deve ser informado';

  @override
  String get passwordDoesNotMatch => 'As senhas não são iguais';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get otherGender => 'Outro (a)';

  @override
  String get passwordLengthRule =>
      'A senha deve ter ao menos 8 caracteres de comprimento';

  @override
  String get passwordSpecialCharacterRule =>
      'A senha deve ter ao menos um caracter especial';

  @override
  String get doNotHaveAccount => 'Não tem conta?';

  @override
  String get signUp => 'Cadastre-se';

  @override
  String get signIn => 'Entrar';

  @override
  String get search => 'Pesquisar';

  @override
  String get searchPatientHint => 'NIF, E-mail, Nome ou Telemóvel';

  @override
  String get newLabel => 'Novo';

  @override
  String get agenda => 'Agenda';

  @override
  String get daily => 'Diário';

  @override
  String get weakly => 'Semanal';

  @override
  String get monthly => 'Mensal';

  @override
  String get to => 'até';

  @override
  String get filter => 'Filtrar';

  @override
  String get patientList => 'Pacientes';

  @override
  String get patientsLabel => 'pacientes';

  @override
  String get doctorLabel => 'Médico';

  @override
  String get descriptionLabel => 'Descrição';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get basicInfo => 'Informações Básicas';

  @override
  String get doctorsList => 'Médicos';

  @override
  String get doctorsLabel => 'médicos';

  @override
  String get medicalRecord => 'Registro Médico';

  @override
  String get hasDiabetes => 'Tem diabetes?';

  @override
  String get hasHypertension => 'Tem hipertensão?';

  @override
  String get hasHeartProblems => 'Tem problemas cardíacos?';

  @override
  String get hasEpilepsy => 'Tem epilepsia?';

  @override
  String get hasAsthma => 'Tem asma?';

  @override
  String get hasOsteoporosis => 'Tem osteoporose?';

  @override
  String get allergies => 'Alergias';

  @override
  String get medications => 'Medicamentos';

  @override
  String get surgeries => 'Cirurgias';

  @override
  String get hasAnestheticAllergy => 'Tem alergia a anestésicos?';

  @override
  String get hasBleedingIssues => 'Tem problemas de sangramento?';

  @override
  String get isPregnant => 'Está grávida?';

  @override
  String get pregnancyMonth => 'Mês da gravidez?';

  @override
  String get newPatient => 'Novo Paciente';

  @override
  String get register => 'Cadastrar';

  @override
  String get edit => 'Editar';

  @override
  String get dateLabel => 'Data';

  @override
  String get beginTimeLabel => 'Início';

  @override
  String get endTimeLabel => 'Término';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get okay => 'Ok';

  @override
  String get cancel => 'Cancelar';

  @override
  String get newAppointment => 'Nova Consulta';

  @override
  String get datesAndTimes => 'Datas e horários';

  @override
  String get addDate => 'Adicionar Data';

  @override
  String get procedures => 'Procedimentos';

  @override
  String get appointmentType => 'Tipo de consulta';

  @override
  String get teeth => 'Dentes';

  @override
  String thePatientRequestedAnConsultation(Object name) {
    return 'O paciente $name solicitou uma consulta, confirmar?';
  }

  @override
  String get patientCreatedSuccessfully => 'Paciente criado com sucesso';

  @override
  String get patientCreatedByClinicSuccessfully =>
      'Paciente criado pela clínica com sucesso';

  @override
  String get patientUpdatedSuccessfully => 'Paciente atualizado com sucesso';

  @override
  String get patientUpdatedByClinicSuccessfully =>
      'Paciente atualizado pela clínica com sucesso';

  @override
  String get consultationScheduledSuccessfully =>
      'Consulta agendada com sucesso';

  @override
  String get consultationUpdatedSuccessfully =>
      'Consulta atualizada com sucesso';

  @override
  String get consultationDeletedSuccessfully => 'Consulta deletada com sucesso';

  @override
  String get consultationConfirmedSuccessfully =>
      'Consulta confirmada com sucesso';

  @override
  String get patientNotFoundException => 'Paciente não encontrado';

  @override
  String get patientUniqueEmailException => 'Paciente já existe com este email';

  @override
  String get patientUniqueDocumentNumberException =>
      'Paciente já existe com este NIF';

  @override
  String get patientNotBelongToClinicException =>
      'Paciente não pertence à clínica';

  @override
  String get youAlreadyHaveAScheduledConsultationException =>
      'Você já tem uma consulta agendada';

  @override
  String get patientAlreadyInClinicException =>
      'Paciente já está na clínica, não pode ser atualizado';

  @override
  String get doctorNotBelongToClinicException =>
      'Médico não pertence à clínica';

  @override
  String get consultationAlreadyIsFinishedException =>
      'Consulta já está finalizada, não pode ser atualizado ou deletado';

  @override
  String get consultationIsCancelledException =>
      'Consulta está cancelada, não pode ser atualizado ou deletado';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get email => 'Email';

  @override
  String get fullName => 'Nome Completo';

  @override
  String get password => 'Senha';

  @override
  String get confirmPassword => 'Confirmar Senha';

  @override
  String get street => 'Rua';

  @override
  String get number => 'Número';

  @override
  String get complement => 'Complemento';

  @override
  String get district => 'Bairro';

  @override
  String get city => 'Cidade';

  @override
  String get state => 'Estado';

  @override
  String get zipCode => 'CEP';

  @override
  String get country => 'País';

  @override
  String get gender => 'Gênero';

  @override
  String get birthDate => 'Data de Nascimento';

  @override
  String get phoneNumber => 'Número de Celular';

  @override
  String get healthNumber => 'Número do SUS';

  @override
  String get documentNumber => 'CPF';

  @override
  String get documentNumberExpirationDate => 'Data de Validade do NIF';

  @override
  String get occupation => 'Ocupação';

  @override
  String get isMandatory => 'é obrigatório';

  @override
  String quantity(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mais de um ',
      zero: 'Um ',
    );
    return '$_temp0';
  }

  @override
  String get validMustBeInformed => 'válido deve ser informado';

  @override
  String get passwordDoesNotMatch => 'As senhas não são iguais';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get otherGender => 'Outro (a)';

  @override
  String get passwordLengthRule =>
      'A senha deve ter ao menos 8 caracteres de comprimento';

  @override
  String get passwordSpecialCharacterRule =>
      'A senha deve ter ao menos um caracter especial';

  @override
  String get doNotHaveAccount => 'Não tem uma conta?';

  @override
  String get signUp => 'Cadastre-se';

  @override
  String get signIn => 'Entrar';

  @override
  String get search => 'Pesquisar';

  @override
  String get searchPatientHint => 'CPF, E-mail, Nome ou Número de Celular';

  @override
  String get newLabel => 'Novo';

  @override
  String get agenda => 'Agenda';

  @override
  String get daily => 'Diário';

  @override
  String get weakly => 'Semanal';

  @override
  String get monthly => 'Mensal';

  @override
  String get to => 'até';

  @override
  String get filter => 'Filtrar';

  @override
  String get patientList => 'Pacientes';

  @override
  String get patientsLabel => 'pacientes';

  @override
  String get doctorLabel => 'Médico';

  @override
  String get descriptionLabel => 'Descrição';

  @override
  String get sortBy => 'Ordenar por';

  @override
  String get basicInfo => 'Informações Básicas';

  @override
  String get doctorsList => 'Médicos';

  @override
  String get doctorsLabel => 'médicos';

  @override
  String get medicalRecord => 'Registro Médico';

  @override
  String get hasDiabetes => 'Tem diabetes?';

  @override
  String get hasHypertension => 'Tem hipertensão?';

  @override
  String get hasHeartProblems => 'Tem problemas cardíacos?';

  @override
  String get hasEpilepsy => 'Tem epilepsia?';

  @override
  String get hasAsthma => 'Tem asma?';

  @override
  String get hasOsteoporosis => 'Tem osteoporose?';

  @override
  String get allergies => 'Alergias';

  @override
  String get medications => 'Medicamentos';

  @override
  String get surgeries => 'Cirurgias';

  @override
  String get hasAnestheticAllergy => 'Tem alergia a anestésicos?';

  @override
  String get hasBleedingIssues => 'Tem problemas de sangramento?';

  @override
  String get isPregnant => 'Está grávida?';

  @override
  String get pregnancyMonth => 'Mês da gravidez?';

  @override
  String get newPatient => 'Novo Paciente';

  @override
  String get register => 'Cadastrar';

  @override
  String get edit => 'Editar';

  @override
  String get dateLabel => 'Data';

  @override
  String get beginTimeLabel => 'Início';

  @override
  String get endTimeLabel => 'Término';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get okay => 'Ok';

  @override
  String get cancel => 'Cancelar';

  @override
  String get newAppointment => 'Nova Consulta';

  @override
  String get datesAndTimes => 'Datas e horários';

  @override
  String get addDate => 'Adicionar Data';

  @override
  String get procedures => 'Procedimentos';

  @override
  String get appointmentType => 'Tipo de consulta';

  @override
  String get teeth => 'Dentes';

  @override
  String thePatientRequestedAnConsultation(Object name) {
    return 'O paciente $name solicitou uma consulta, confirmar?';
  }

  @override
  String get patientCreatedSuccessfully => 'Paciente criado com sucesso';

  @override
  String get patientCreatedByClinicSuccessfully =>
      'Paciente criado pela clínica com sucesso';

  @override
  String get patientUpdatedSuccessfully => 'Paciente atualizado com sucesso';

  @override
  String get patientUpdatedByClinicSuccessfully =>
      'Paciente atualizado pela clínica com sucesso';

  @override
  String get consultationScheduledSuccessfully =>
      'Consulta agendada com sucesso';

  @override
  String get consultationUpdatedSuccessfully =>
      'Consulta atualizada com sucesso';

  @override
  String get consultationDeletedSuccessfully => 'Consulta deletada com sucesso';

  @override
  String get consultationConfirmedSuccessfully =>
      'Consulta confirmada com sucesso';

  @override
  String get patientNotFoundException => 'Paciente não encontrado';

  @override
  String get patientUniqueEmailException => 'Paciente já existe com este email';

  @override
  String get patientUniqueDocumentNumberException =>
      'Paciente já existe com este NIF';

  @override
  String get patientNotBelongToClinicException =>
      'Paciente não pertence à clínica';

  @override
  String get youAlreadyHaveAScheduledConsultationException =>
      'Você já tem uma consulta agendada';

  @override
  String get patientAlreadyInClinicException =>
      'Paciente já está na clínica, não pode ser atualizado';

  @override
  String get doctorNotBelongToClinicException =>
      'Médico não pertence à clínica';

  @override
  String get consultationAlreadyIsFinishedException =>
      'Consulta já está finalizada, não pode ser atualizado ou deletado';

  @override
  String get consultationIsCancelledException =>
      'Consulta está cancelada, não pode ser atualizado ou deletado';
}
