part of 'patient_register_screen.dart';

class _PatientRegisterMobileScreen extends StatelessWidget {

  const _PatientRegisterMobileScreen();

  @override
  Widget build(BuildContext context) {
    PatientRegisterProvider provider = Provider.of<PatientRegisterProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBarScreen(
        appBar: PreferredSize(
          preferredSize: Size(context.width, 100),
          child: Container(
            width: context.width,
            padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
            child: Row(
              children: [
                HeaderTitle(icon: Icons.person_add_alt, title: t.newPatient),
              ],
            ),
          ),
        ),
        child: Container(
          width: context.width,
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: provider.formKey,
              child: Column(
                spacing: 16,
                children: [
                  CountryFormField(
                    country: provider.tecCountry,
                    onChanged: (value) => provider.updateCountry(value),
                  ),
                  EmailFormField(controller: provider.tecEmail, enabled: provider.tecCountry.isNotEmpty),
                  PasswordFormField(
                      controller: provider.tecPassword,
                      updateShowPassword: () => provider.updateShowPassword(),
                      showPassword: provider.showPassword,
                      enabled: provider.tecCountry.isNotEmpty)
                      ,
                  ConfirmPasswordFormField(
                    controller: provider.tecConfirmPassword,
                    updateShowPassword: () => provider.updateShowPassword(),
                    showPassword: provider.showPassword,
                    enabled: provider.tecCountry.isNotEmpty,
                    password: provider.tecPassword.text,
                  ),
                  FullNameFormField(controller: provider.tecFullName, enabled: provider.tecCountry.isNotEmpty),
                  PostalCodeFormField(
                    controller: provider.tecZipCode,
                    postalCodeValidator: provider.getPostalCodeValidator(),
                    formatter: provider.getPostalCodeFormatter(),
                    hintText: provider.getPostalCodeHint(),
                    enabled: provider.tecCountry.isNotEmpty,
                  ),
                  StreetFormField(controller: provider.tecStreet, enabled: provider.tecCountry.isNotEmpty),
                  NumberFormField(
                    controller: provider.tecNumber,
                    enabled: provider.tecCountry.isNotEmpty,
                  ),
                  ComplementFormField(controller: provider.tecComplement, enabled: provider.tecCountry.isNotEmpty),
                  StateFormField(
                    enabled: provider.tecCountry.isNotEmpty,
                    state: provider.tecState,
                    states: provider.states,
                    onChanged: (String value) {
                      provider.updateState(value);
                    },
                  ),
                  CityFormField(
                      enabled: provider.tecCountry.isNotEmpty,
                      city: provider.tecCity,
                      cities: provider.cities,
                      onChanged: (String value) {
                        provider.updateCity(value);
                      }),
                  GenderFormField(
                    enabled: provider.tecCountry.isNotEmpty,
                    onChanged: (value) => provider.updateGender(value),
                    gender: provider.tecGender,
                  ),
                  DocumentNumberFormField(
                    controller: provider.tecDocumentNumber,
                    enabled: provider.tecCountry.isNotEmpty,
                    regExpValidator: provider.documentNumberValidator(),
                    formatter: provider.documentNumberFormatter(),
                  ),
                  BirthdayDateFormField(
                    enabled: provider.tecCountry.isNotEmpty,
                    controller: provider.tecBirthDate,
                  ),
                  PhoneNumberFormField(
                    controller: provider.tecPhoneNumber,
                    enabled: provider.tecCountry.isNotEmpty,
                    validator: provider.phoneValidator(),
                    formatter: provider.phoneFormatter(),
                  ),
                  OccupationFormField(
                    controller: provider.tecOccupation,
                    enabled: provider.tecCountry.isNotEmpty,
                  ),
                  SizedBox(
                    width: context.width,
                    child: RegisterButton(
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}