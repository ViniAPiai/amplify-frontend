part of 'patient_register_screen.dart';

class _PatientRegisterDesktopScreen extends StatelessWidget {
  const _PatientRegisterDesktopScreen();

  @override
  Widget build(BuildContext context) {
    PatientRegisterProvider provider = Provider.of<PatientRegisterProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBarScreen(
      child: SizedBox(
          width: context.width,
          height: context.height,
          child: Column(
            children: [
              Container(
                width: context.width,
                padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                child: Row(
                  spacing: 16,
                  children: [
                    HeaderTitle(icon: Icons.person_add_alt, title: t.newPatient),
                    SizedBox().expanded(),
                    RegisterButton(
                      onPressed: () => provider.validateForm(context),
                    ),
                    LocaleChanger()
                  ],
                ),
              ),
              !provider.isLoading ? Container(
                width: context.width,
                padding: EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: provider.formKey,
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            CountryFormField(
                              country: provider.tecCountry,
                              onChanged: (value) => provider.updateCountry(value),
                              enabled: false,
                            ).expanded(),
                            EmailFormField(controller: provider.tecEmail, enabled: provider.tecCountry.isNotEmpty).expanded(),
                          ],
                        ),
                        Row(spacing: 16, children: [
                          PasswordFormField(
                                  controller: provider.tecPassword,
                                  updateShowPassword: () => provider.updateShowPassword(),
                                  showPassword: provider.showPassword,
                                  enabled: provider.tecCountry.isNotEmpty)
                              .expanded(),
                          ConfirmPasswordFormField(
                            controller: provider.tecConfirmPassword,
                            updateShowPassword: () => provider.updateShowPassword(),
                            showPassword: provider.showPassword,
                            enabled: provider.tecCountry.isNotEmpty,
                            password: provider.tecPassword.text,
                          ).expanded()
                        ]),
                        Row(
                          spacing: 16,
                          children: [
                            FullNameFormField(controller: provider.tecFullName, enabled: provider.tecCountry.isNotEmpty).expanded(),
                            ZipCodeFormField(
                              controller: provider.tecZipCode,
                              country: provider.tecCountry,
                              enabled: provider.tecCountry.isNotEmpty,
                            ).expanded(),
                          ],
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            StreetFormField(controller: provider.tecStreet, enabled: provider.tecCountry.isNotEmpty).expanded(),
                            NumberFormField(
                              controller: provider.tecNumber,
                              enabled: provider.tecCountry.isNotEmpty,
                            ).expanded(),
                          ],
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            ComplementFormField(controller: provider.tecComplement, enabled: provider.tecCountry.isNotEmpty).expanded(),
                            StateFormField(
                              enabled: provider.tecCountry.isNotEmpty,
                              state: provider.tecState,
                              states: provider.states,
                              onChanged: (String value) {
                                provider.updateState(value);
                              },
                            ).expanded(),
                          ],
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            CityFormField(
                                enabled: provider.tecCountry.isNotEmpty,
                                city: provider.tecCity,
                                cities: provider.cities,
                                onChanged: (String value) {
                                  provider.updateCity(value);
                                }).expanded(),
                            GenderFormField(
                              enabled: provider.tecCountry.isNotEmpty,
                              onChanged: (value) => provider.updateGender(value),
                              gender: provider.tecGender,
                            ).expanded(),
                          ],
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            DocumentNumberFormField(
                                    controller: provider.tecDocumentNumber, enabled: provider.tecCountry.isNotEmpty, country: provider.tecCountry)
                                .expanded(),
                            BirthdayDateFormField(
                              enabled: provider.tecCountry.isNotEmpty,
                              controller: provider.tecBirthDate,
                            ).expanded(),
                          ],
                        ),
                        Row(
                          spacing: 16,
                          children: [
                            PhoneNumberFormField(
                                    controller: provider.tecPhoneNumber, enabled: provider.tecCountry.isNotEmpty, country: provider.tecCountry)
                                .expanded(),
                            OccupationFormField(
                              controller: provider.tecOccupation,
                              enabled: provider.tecCountry.isNotEmpty,
                            ).expanded(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ).expanded() : Center(child: CircularProgressIndicator(),).expanded()
            ],
          )),
    );
  }
}
