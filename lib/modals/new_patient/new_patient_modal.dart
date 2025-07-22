

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/bloc/locale/locale_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/bloc/sign_up/sign_up_bloc.dart';
import 'package:frontend/bloc/sign_up/sign_up_event.dart';
import 'package:frontend/bloc/sign_up/sign_up_state.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/extension/message_extension.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/extension/widget_extension.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/models/simple/simple_response.dart';
import 'package:frontend/utils/document_number_formatter.dart';
import 'package:frontend/utils/phone_number_formatter.dart';
import 'package:frontend/utils/zip_code_formatter.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

class NewPatientModal extends StatefulWidget {
  const NewPatientModal({super.key, this.uuid = '', required this.width});

  final String uuid;
  final double width;

  @override
  State<NewPatientModal> createState() => _NewPatientModalState();
}

class _NewPatientModalState extends State<NewPatientModal> {
  final _formKeyBasicInformation = GlobalKey<FormState>();
  final _formKeyAddress = GlobalKey<FormState>();
  final _formKeyPersonalInformation = GlobalKey<FormState>();
  final _tecFullName = TextEditingController();
  final _tecEmail = TextEditingController();
  final _tecPassword = TextEditingController();
  final _tecConfirmPassword = TextEditingController();
  final _tecDocumentNumber = TextEditingController();
  final _tecStreet = TextEditingController();
  final _tecNumber = TextEditingController();
  final _tecComplement = TextEditingController();
  final _tecDistrict = TextEditingController();
  final _tecZipCode = TextEditingController();
  final _tecBirthDate = TextEditingController();
  final _tecPhoneNumber = TextEditingController();
  final _tecHealthNumber = TextEditingController();
  final _tecOccupation = TextEditingController();

  final _fnFullName = FocusNode();
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnConfirmPassword = FocusNode();
  final _fnDocumentNumber = FocusNode();
  final _fnStreet = FocusNode();
  final _fnNumber = FocusNode();
  final _fnComplement = FocusNode();
  final _fnDistrict = FocusNode();
  final _fnZipCode = FocusNode();
  final _fnBirthDate = FocusNode();
  final _fnPhoneNumber = FocusNode();
  final _fnHealthNumber = FocusNode();
  final _fnOccupation = FocusNode();

  @override
  void initState() {
    super.initState();
    LocaleBloc localeBloc = context.read<LocaleBloc>();
    DateFormat format = DateFormat.yMd(context.getLocaleString(localeBloc.state.locale));
    _tecFullName.addListener(() => context.read<SignUpBloc>().add(UpdateFields(fullName: _tecFullName.text)));
    _tecEmail.addListener(() => context.read<SignUpBloc>().add(UpdateFields(email: _tecEmail.text)));
    _tecPassword.addListener(() => context.read<SignUpBloc>().add(UpdateFields(password: _tecPassword.text)));
    _tecConfirmPassword.addListener(() => context.read<SignUpBloc>().add(UpdateFields(confirmPassword: _tecConfirmPassword.text)));
    _tecDocumentNumber.addListener(() => context.read<SignUpBloc>().add(UpdateFields(documentNumber: _tecDocumentNumber.text)));
    _tecStreet.addListener(() => context.read<SignUpBloc>().add(UpdateFields(street: _tecStreet.text)));
    _tecNumber.addListener(() => context.read<SignUpBloc>().add(UpdateFields(number: _tecNumber.text)));
    _tecComplement.addListener(() => context.read<SignUpBloc>().add(UpdateFields(complement: _tecComplement.text)));
    _tecDistrict.addListener(() => context.read<SignUpBloc>().add(UpdateFields(neighborhood: _tecDistrict.text)));
    _tecZipCode.addListener(() => context.read<SignUpBloc>().add(UpdateFields(zipCode: _tecZipCode.text)));
    _tecBirthDate.addListener(() => context.read<SignUpBloc>().add(UpdateFields(birthDate: format.parse(_tecBirthDate.text))));
    _tecPhoneNumber.addListener(() => context.read<SignUpBloc>().add(UpdateFields(phoneNumber: _tecPhoneNumber.text)));
    _tecHealthNumber.addListener(() => context.read<SignUpBloc>().add(UpdateFields(healthNumber: _tecHealthNumber.text)));
    _tecOccupation.addListener(() => context.read<SignUpBloc>().add(UpdateFields(occupation: _tecOccupation.text)));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    LocaleBloc localeBloc = context.read<LocaleBloc>();
    DateFormat format = DateFormat.yMd(context.getLocaleString(localeBloc.state.locale));
    return BlocListener<SignUpBloc, SignUpState>(
      listenWhen: (previous, current) =>
          previous.isLoadingCountries != current.isLoadingCountries ||
          previous.isLoadingStates != current.isLoadingStates ||
          previous.isLoadingCities != current.isLoadingCities ||
          previous.formValidation != current.formValidation ||
          previous.isLoadingClinicCountry != current.isLoadingClinicCountry ||
          previous.successSubmittingForm != current.successSubmittingForm,
      listener: (context, state) {
        _tecFullName.text = state.fullName;
        _tecEmail.text = state.email;
        _tecPassword.text = state.password;
        _tecConfirmPassword.text = state.confirmPassword;
        _tecDocumentNumber.text = state.documentNumber;
        _tecStreet.text = state.street;
        _tecNumber.text = state.number;
        _tecComplement.text = state.complement;
        _tecDistrict.text = state.neighborhood;
        _tecZipCode.text = state.zipCode;
        _tecPhoneNumber.text = state.phoneNumber;
        _tecHealthNumber.text = state.healthNumber;
        _tecBirthDate.text = format.format(state.birthDate);
        _tecOccupation.text = state.occupation;

        if (state.successSubmittingForm) {
          context.read<SideBarBloc>().add(ToggleNewPatientModal());
          toastification.show(
              title: Text(context.getMessage(state.message.message!),
                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400)),
              type: ToastificationType.success,
              style: ToastificationStyle.minimal,
              showProgressBar: true,
              autoCloseDuration: Duration(seconds: 10));
        }
      },
      child: BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    state.patientUuid.isEmpty ? t.newPatient : t.updatePatient,
                    style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  IconButton(onPressed: () => context.read<SideBarBloc>().add(ToggleNewPatientModal()), icon: Icon(Icons.close))
                ],
              ),
              Divider(),
              SizedBox(
                width: widget.width,
                height: context.height - 160,
                child: Stepper(
                    currentStep: state.step,
                    type: StepperType.horizontal,
                    physics: ClampingScrollPhysics(),
                    elevation: 0,
                    controlsBuilder: (context, details) {
                      return Row(
                        children: [
                          if (state.step > 0)
                            IconButton(
                                onPressed: () => context.read<SignUpBloc>().add(PreviousStep()),
                                icon: Icon(
                                  Icons.arrow_back_ios_new,
                                  color: AppColors.black,
                                  size: 24,
                                )),
                          Expanded(child: SizedBox()),
                          if (state.step < 2)
                            TextButton(
                              onPressed: () {
                                if ((state.step == 0 && (_formKeyBasicInformation.currentState?.validate() ?? false)) ||
                                    (state.step == 1 && (_formKeyAddress.currentState?.validate() ?? false))) {
                                  context.read<SignUpBloc>().add(NextStep());
                                }
                              },
                              child: Text(
                                t.next,
                                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ),
                          if (state.step == 2)
                            TextButton(
                                onPressed: () {
                                  if (_formKeyPersonalInformation.currentState?.validate() ?? false) {
                                    context.read<SignUpBloc>().add(SignUpSubmit());
                                  }
                                },
                                child: Text(state.patientUuid.isEmpty ? t.register : t.update,
                                    style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700)))
                        ],
                      );
                    },
                    steps: [
                      Step(
                        title: state.step == 0
                            ? Text(
                                t.basicInformation,
                                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
                              )
                            : const SizedBox(),
                        state: state.step == 0 ? StepState.editing : StepState.complete,
                        isActive: state.step == 0,
                        stepStyle: StepStyle(
                          color: state.step == 0 ? context.primaryColor : null,
                        ),
                        content: _basicInformation(),
                      ),
                      Step(
                          title: state.step == 1
                              ? Text(
                                  t.address,
                                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
                                )
                              : const SizedBox(),
                          state: state.step == 1 ? StepState.editing : StepState.indexed,
                          isActive: state.step == 1,
                          stepStyle: StepStyle(
                            color: state.step == 1 ? context.primaryColor : null,
                          ),
                          content: _address()),
                      Step(
                          title: state.step == 2
                              ? Text(
                                  t.personalInformation,
                                  style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
                                )
                              : const SizedBox(),
                          state: state.step == 2 ? StepState.editing : StepState.indexed,
                          isActive: state.step == 2,
                          stepStyle: StepStyle(
                            color: state.step == 2 ? context.primaryColor : null,
                          ),
                          content: _personalInformation()),
                    ]),
              ),
            ],
          ).paddingAll(context.isDesktop ? 32 : 8),
        );
      }),
    );
  }

  Widget _basicInformation() {
    AppLocalizations t = AppLocalizations.of(context)!;
    RegExp brazil = RegExp(r'^\d{3}\.?\d{3}\.?\d{3}-?\d{2}$');
    RegExp portugal = RegExp(r'^\d{9}$');
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.clinicCountry != current.clinicCountry || previous.isLoadingClinicCountry != current.isLoadingClinicCountry,
        builder: (context, state) {
          if (state.isLoadingClinicCountry) {
            return SizedBox(
              width: widget.width,
              height: context.height - 320,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          }
          return SizedBox(
            width: widget.width,
            height: context.height - 320,
            child: Form(
              key: _formKeyBasicInformation,
              child: FocusTraversalGroup(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: context.isTabletOrDesktop ? 16 : 8,
                    children: [
                      Label(label: t.fullName),
                      TextFormField(
                          controller: _tecFullName,
                          focusNode: _fnFullName,
                          decoration: InputDecoration(hintText: t.fullName, border: OutlineInputBorder()),
                          onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnEmail),
                          validator: RequiredValidator(errorText: "${t.fullName} ${t.isMandatory}").call),
                      Label(label: t.email),
                      TextFormField(
                        controller: _tecEmail,
                        focusNode: _fnEmail,
                        decoration: InputDecoration(hintText: t.email, border: OutlineInputBorder()),
                        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnPassword),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "${t.email} ${t.isMandatory}"),
                          EmailValidator(errorText: "${t.quantity(1)} ${t.email} ${t.validMustBeInformed}")
                        ]).call,
                      ),
                      if (state.patientUuid.isEmpty) Label(label: t.password),
                      if (state.patientUuid.isEmpty)
                        TextFormField(
                          controller: _tecPassword,
                          focusNode: _fnPassword,
                          decoration: InputDecoration(
                              hintText: t.password,
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () => context.read<SignUpBloc>().add(UpdateFields(showPassword: !state.showPassword)),
                                  icon: FaIcon(state.showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye))),
                          onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnConfirmPassword),
                          validator: MultiValidator([
                            RequiredValidator(errorText: '${t.password} ${t.isMandatory}'),
                            MinLengthValidator(8, errorText: t.passwordLengthRule),
                            PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: t.passwordSpecialCharacterRule)
                          ]).call,
                          obscureText: !state.showPassword,
                        ),
                      if (state.patientUuid.isEmpty) Label(label: t.confirmPassword),
                      if (state.patientUuid.isEmpty)
                        TextFormField(
                          controller: _tecConfirmPassword,
                          focusNode: _fnConfirmPassword,
                          decoration: InputDecoration(
                              hintText: t.confirmPassword,
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () => context.read<SignUpBloc>().add(UpdateFields(showPassword: !state.showPassword)),
                                  icon: FaIcon(state.showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye))),
                          onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnDocumentNumber),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '${t.confirmPassword} ${t.isMandatory}';
                            }
                            if (value != _tecPassword.text) {
                              return t.passwordDoesNotMatch;
                            }
                            return null;
                          },
                          obscureText: !state.showPassword,
                        ),
                      Label(label: t.documentNumber),
                      TextFormField(
                        controller: _tecDocumentNumber,
                        focusNode: _fnDocumentNumber,
                        decoration: InputDecoration(hintText: t.documentNumber, border: OutlineInputBorder()),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(state.clinicCountry == "brazil" ? 14 : 9),
                          DocumentNumberFormatter(country: state.clinicCountry)
                        ],
                        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(null),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${t.documentNumber} ${t.isMandatory}";
                          }
                          if (state.clinicCountry == "brazil") {
                            if (!brazil.hasMatch(value)) {
                              return "${t.quantity(1)} ${t.documentNumber} ${t.validMustBeInformed}";
                            }
                          } else {
                            if (!portugal.hasMatch(value)) {
                              return "${t.quantity(1)} ${t.documentNumber} ${t.validMustBeInformed}";
                            }
                          }
                          return null;
                        },
                      ),
                      Label(label: t.gender),
                      DropdownButtonFormField(
                        value: state.gender,
                        items: ['', t.male, t.female, t.otherGender].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                        onChanged: (value) => context.read<SignUpBloc>().add(UpdateFields(gender: value)),
                        decoration: InputDecoration(hintText: t.gender, border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "${t.gender} ${t.isMandatory}";
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _address() {
    AppLocalizations t = AppLocalizations.of(context)!;
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) =>
            previous.isLoadingCountries != current.isLoadingCountries ||
            previous.isLoadingStates != current.isLoadingStates ||
            previous.isLoadingCities !=
                current
                    .isLoadingCities /*||
            previous.country != current.country ||
            previous.state != current.state ||
            previous.city != current.city*/
        ,
        builder: (context, state) {
          if (state.isLoadingCountries) {
            return SizedBox(
              width: 700,
              height: context.height - 320,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            );
          }
          return SizedBox(
            width: 700,
            height: context.height - 320,
            child: Form(
              key: _formKeyAddress,
              child: FocusTraversalGroup(
                child: SingleChildScrollView(
                  child: Column(spacing: 16, children: [
                    Label(label: t.country),
                    DropdownButtonFormField<SimpleResponse>(
                        value: state.country,
                        onChanged: (value) => context.read<SignUpBloc>().add(UpdateCountry(country: value!)),
                        items: state.countries.map(
                          (e) {
                            return DropdownMenuItem(value: e, child: Text(context.convert(e.name)));
                          },
                        ).toList(),
                        decoration: InputDecoration(
                          hintText: t.country,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.uuid.isEmpty) {
                            return "${t.country} ${t.isMandatory}";
                          }
                          return null;
                        }),
                    Label(label: t.state),
                    DropdownButtonFormField<SimpleResponse>(
                        value: state.state,
                        onChanged: (value) => context.read<SignUpBloc>().add(UpdateState(state: value!)),
                        items: state.states
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.name),
                                ))
                            .toList(),
                        decoration: InputDecoration(hintText: t.state, border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.uuid.isEmpty) {
                            return "${t.state} ${t.isMandatory}";
                          }
                          return null;
                        }).ignorePointer(ignoring: state.country.uuid.isEmpty),
                    Label(label: t.city),
                    DropdownButtonFormField<SimpleResponse>(
                        value: state.city,
                        onChanged: (value) => context.read<SignUpBloc>().add(UpdateCity(city: value!)),
                        items: state.cities.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                        decoration: InputDecoration(hintText: t.city, border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.uuid.isEmpty) {
                            return "${t.city} ${t.isMandatory}";
                          }
                          return null;
                        }).ignorePointer(ignoring: state.state.uuid.isEmpty),
                    Label(label: t.street),
                    TextFormField(
                      controller: _tecStreet,
                      focusNode: _fnStreet,
                      decoration: InputDecoration(hintText: t.street, border: OutlineInputBorder()),
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnNumber),
                      validator: RequiredValidator(errorText: "${t.street} ${t.isMandatory}").call,
                    ),
                    Label(label: t.number),
                    TextFormField(
                      controller: _tecNumber,
                      focusNode: _fnNumber,
                      decoration: InputDecoration(hintText: t.number, border: OutlineInputBorder()),
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnComplement),
                      validator: RequiredValidator(errorText: "${t.number} ${t.isMandatory}").call,
                    ),
                    Label(label: t.complement),
                    TextFormField(
                      controller: _tecComplement,
                      focusNode: _fnComplement,
                      decoration: InputDecoration(hintText: t.complement, border: OutlineInputBorder()),
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnDistrict),
                      validator: RequiredValidator(errorText: "${t.complement} ${t.isMandatory}").call,
                    ),
                    Label(label: t.neighborhood),
                    TextFormField(
                      controller: _tecDistrict,
                      focusNode: _fnDistrict,
                      decoration: InputDecoration(hintText: t.neighborhood, border: OutlineInputBorder()),
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnZipCode),
                      validator: RequiredValidator(errorText: "${t.neighborhood} ${t.isMandatory}").call,
                    ),
                    Label(label: t.zipCode),
                    TextFormField(
                      controller: _tecZipCode,
                      focusNode: _fnZipCode,
                      decoration: InputDecoration(hintText: t.zipCode, border: OutlineInputBorder()),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(state.clinicCountry == "brazil" ? 9 : 8),
                        ZipCodeFormatter(),
                      ],
                      onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(null),
                      validator: RequiredValidator(errorText: "${t.zipCode} ${t.isMandatory}").call,
                    ),
                  ]),
                ),
              ),
            ),
          );
        });
  }

  Widget _personalInformation() {
    AppLocalizations t = AppLocalizations.of(context)!;
    LocaleBloc localeBloc = context.read<LocaleBloc>();
    DateFormat format = DateFormat.yMEd(context.getLocaleString(localeBloc.state.locale));
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SizedBox(
        width: 700,
        height: context.height - 320,
        child: Form(
          key: _formKeyPersonalInformation,
          child: FocusTraversalGroup(
            child: SingleChildScrollView(
              child: Column(spacing: 16, children: [
                Label(label: t.birthDate),
                TextFormField(
                  controller: _tecBirthDate,
                  focusNode: _fnBirthDate,
                  decoration: InputDecoration(
                      hintText: t.birthDate,
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1940, 1, 1),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              locale: context.locale,
                            );
                            if (date != null) {
                              _tecBirthDate.text = format.format(date);
                              context.read<SignUpBloc>().add(UpdateFields(birthDate: date));
                            }
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            color: AppColors.black,
                            size: 24,
                          ))),
                  validator: RequiredValidator(errorText: "${t.birthDate} ${t.isMandatory}").call,
                  readOnly: true,
                ),
                Label(label: t.phoneNumber),
                TextFormField(
                  controller: _tecPhoneNumber,
                  focusNode: _fnPhoneNumber,
                  decoration: InputDecoration(
                      hintText: state.clinicCountry == "brazil" ? '+55 (00) 00000-0000' : '+351 000 000 000', border: OutlineInputBorder()),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly, PhoneNumberFormatter(country: state.clinicCountry)],
                  onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnHealthNumber),
                  validator: RequiredValidator(errorText: "${t.phoneNumber} ${t.isMandatory}").call,
                ),
                Label(label: t.healthNumber),
                TextFormField(
                  controller: _tecHealthNumber,
                  focusNode: _fnHealthNumber,
                  decoration: InputDecoration(hintText: t.healthNumber, border: OutlineInputBorder()),
                  onEditingComplete: () => context.read<SignUpBloc>().add(UpdateFields(healthNumber: _tecHealthNumber.text)),
                  onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(_fnOccupation),
                  validator: RequiredValidator(errorText: "${t.healthNumber} ${t.isMandatory}").call,
                ),
                Label(label: t.occupation),
                TextFormField(
                  controller: _tecOccupation,
                  focusNode: _fnOccupation,
                  decoration: InputDecoration(hintText: t.occupation, border: OutlineInputBorder()),
                  onEditingComplete: () => context.read<SignUpBloc>().add(UpdateFields(occupation: _tecOccupation.text)),
                  onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(null),
                  validator: RequiredValidator(errorText: "${t.occupation} ${t.isMandatory}").call,
                ),
              ]),
            ),
          ),
        ),
      );
    });
  }
}
