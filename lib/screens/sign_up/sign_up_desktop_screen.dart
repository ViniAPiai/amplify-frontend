part of 'sign_up_screen.dart';

class _$SignUpDesktopScreen extends StatefulWidget {
  const _$SignUpDesktopScreen({super.key});

  @override
  createState() => _SignUpDesktopScreen();
}

class _SignUpDesktopScreen extends State<_$SignUpDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Center(
            child: IconButton(onPressed: () => GoRouter.of(context).go("/"), icon: FaIcon(FontAwesomeIcons.arrowLeft))),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LocaleChanger(),
          )
        ],
        centerTitle: true,
        title: SvgPicture.asset(Assets.amplifySecondaryGreen, height: 45),
      ),
      body: Consumer<SignUpProvider>(builder: (context, provider, child) {
        return Container(
          color: Colors.white,
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            currentStep: provider.currentStep,
            steps: [
              Step(
                  title: Text("Informações Básicas", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),),
                  content: basicInfo(provider),
                  isActive: provider.currentStep == 0,
                  state: provider.currentStep == 0 ? StepState.editing : StepState.indexed),
              Step(
                  title: Text("Endereço", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500)),
                  content: addressInfo(provider),
                  isActive: provider.currentStep == 1,
                  state: provider.currentStep == 1 ? StepState.editing : StepState.indexed),
              Step(
                  title: Text("Informações Pessoais", style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500)),
                  content: patientInfo(provider),
                  isActive: provider.currentStep == 2,
                  state: provider.currentStep == 2 ? StepState.editing : StepState.indexed)
            ],
            onStepTapped: (step) => provider.onStepTapped(step),
            onStepContinue: () => provider.continueStep(),
            onStepCancel: () => provider.cancel(),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (provider.currentStep > 0)
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: Text("Voltar", style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(provider.currentStep == 2 ? "Finalizar" : "Próximo", style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              );
            },

          ),
        );
      }),
      /*body: Stack(
        children: [
          Consumer<SignUpProvider>(
            builder: (context, provider, child) {
              return Container(
                color: Colors.white,
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    basicInfo(provider),
                    addressInfo(provider),
                    patientInfo(provider),
                  ],
                ),
              );
            },
          ),
        ],
      ),*/
    );
  }

  Widget basicInfo(SignUpProvider provider) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: provider.currentStep == 0 ? 1 : 0.3,
      child: IgnorePointer(
        ignoring: provider.currentStep != 0,
        child: Form(
          key: provider.formKeyBasicInfo,
          child: Container(
            width: context.mqWidth * .33,
            color: Colors.white,
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.zero,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                spacing: 16,
                children: [
                  /*SizedBox(
                    height: context.mqHeight * .3,
                    child: Column(
                      spacing: 16,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "AMPLIFY",
                          style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "Informações básicas",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),*/
                  CountryFormField(country: provider.tecCountry, onChanged: (value) => provider.updateCountry(value)),
                  EmailFormField(
                    controller: provider.tecEmail,
                    currentFocusNode: provider.fnEmail,
                    nextFocusNode: provider.fnFullName,
                    enabled: provider.currentStep == 0,
                  ),
                  FullNameFormField(
                    controller: provider.tecFullName,
                    currentFocusNode: provider.fnFullName,
                    nextFocusNode: provider.fnPassword,
                    enabled: provider.currentStep == 0,
                  ),
                  PasswordFormField(
                    controller: provider.tecPassword,
                    updateShowPassword: () => provider.updateShowPassword(),
                    showPassword: provider.showPassword,
                    enabled: provider.currentStep == 0,
                  ),
                  ConfirmPasswordFormField(
                    controller: provider.tecConfirmPassword,
                    updateShowPassword: () => provider.updateShowPassword(),
                    showPassword: provider.showPassword,
                    password: provider.tecPassword.text,
                    enabled: provider.currentStep == 0,
                    currentFocusNode: provider.fnConfirmPassword,
                    nextFocusNode: provider.fnZipCode,
                  ),
                  /*provider.currentStep == 0
                      ? FilledButton(
                          onPressed: () {
                            if (provider.formKeyBasicInfo.currentState != null) {
                              if (provider.formKeyBasicInfo.currentState!.validate()) {
                                provider.updatePage(1);
                              }
                            }
                          },
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.all(16),
                              fixedSize: Size(context.mqWidth * .3, 50)),
                          child: Text(
                            "Continuar",
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                          ))
                      : const SizedBox(),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget addressInfo(SignUpProvider provider) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: provider.currentStep == 1 ? 1 : 0.3,
      child: IgnorePointer(
        ignoring: provider.currentStep != 1,
        child: Form(
          key: provider.formKeyAddressInfo,
          child: Container(
            width: context.mqWidth * .34,
            color: Colors.white,
            padding: EdgeInsets.all(32),
            margin: EdgeInsets.zero,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                spacing: 16,
                children: [
                  /*SizedBox(
                          height: context.mqHeight * .3,
                          child: Column(
                            spacing: 16,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "AMPLIFY",
                                style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "Endereço",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),*/
                  PostalCodeFormField(
                    controller: provider.tecZipCode,
                    postalCodeValidator: provider.getPostalCodeValidator(),
                    formatter: provider.getPostalCodeFormatter(),
                    hintText: provider.getPostalCodeHint(),
                    enabled: provider.currentStep == 1,
                    currentFocusNode: provider.fnZipCode,
                    nextFocusNode: provider.fnStreet,
                  ),
                  StreetFormField(
                    controller: provider.tecStreet,
                    enabled: provider.currentStep == 1,
                    currentFocusNode: provider.fnStreet,
                    nextFocusNode: provider.fnNumber,
                  ),
                  NumberFormField(
                    controller: provider.tecNumber,
                    enabled: provider.currentStep == 1,
                    currentFocusNode: provider.fnNumber,
                    nextFocusNode: provider.fnComplement,
                  ),
                  ComplementFormField(
                    controller: provider.tecComplement,
                    enabled: provider.currentStep == 1,
                    currentFocusNode: provider.fnComplement,
                    nextFocusNode: provider.fnDistrict,
                  ),
                  StateFormField(
                    enabled: provider.currentStep == 1,
                    state: provider.tecState,
                    states: provider.states,
                    onChanged: (String value) {
                      provider.updateState(value);
                    },
                  ),
                  CityFormField(
                      enabled: provider.currentStep == 1,
                      city: provider.tecCity,
                      cities: provider.cities,
                      onChanged: (String value) {
                        provider.updateCity(value);
                      }),
                  /*provider.currentStep == 1
                            ? Row(
                                spacing: 16,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  OutlinedButton(
                                      onPressed: () {
                                        provider.updatePage(0);
                                      },
                                      style: FilledButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          backgroundColor: Colors.white,
                                          padding: EdgeInsets.all(16),
                                          fixedSize: Size(context.mqWidth * .34 * .42, 50)),
                                      child: Text(
                                        "Voltar",
                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
                                      )),
                                  FilledButton(
                                      onPressed: () {
                                        if (provider.formKeyAddressInfo.currentState!.validate()) {
                                          provider.updatePage(2);
                                        }
                                      },
                                      style: FilledButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          backgroundColor: Colors.black,
                                          padding: EdgeInsets.all(16),
                                          fixedSize: Size(context.mqWidth * .34 * .42, 50)),
                                      child: Text(
                                        "Continuar",
                                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                                      )),
                                ],
                              )
                            : const SizedBox()*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget patientInfo(SignUpProvider provider) {
    return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: provider.currentStep == 2 ? 1 : 0.3,
        child: IgnorePointer(
            ignoring: provider.currentStep != 2,
            child: Form(
              key: provider.formKeyPatientInfo,
              child: Container(
                width: context.mqWidth * .33,
                color: Colors.white,
                padding: EdgeInsets.all(32),
                margin: EdgeInsets.zero,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    spacing: 16,
                    children: [
                      /*SizedBox(
                        height: context.mqHeight * .3,
                        child: Column(
                          spacing: 16,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "AMPLIFY",
                              style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900),
                            ),
                            Text(
                              "Informações do Pessoais",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                      ),*/
                      GenderFormField(
                        enabled: provider.currentStep == 2,
                        onChanged: (value) => provider.updateGender(value),
                        gender: provider.tecGender,
                      ),
                      DocumentNumberFormField(
                          controller: provider.tecDocumentNumber,
                          enabled: provider.currentStep == 2,
                          regExpValidator: provider.documentNumberValidator(),
                          formatter: provider.documentNumberFormatter(),
                          currentFocusNode: provider.fnDocumentNumber,
                          nextFocusNode: provider.fnBirthDate),
                      BirthdayDateFormField(
                          enabled: provider.currentStep == 2,
                          controller: provider.tecBirthDate,
                          currentFocusNode: provider.fnBirthDate,
                          nextFocusNode: provider.fnHealthNumber),
                      PhoneNumberFormField(
                        controller: provider.tecPhoneNumber,
                        enabled: provider.currentStep == 2,
                        validator: provider.phoneValidator(),
                        formatter: provider.phoneFormatter(),
                        currentFocusNode: provider.fnPhoneNumber,
                        nextFocusNode: provider.fnOccupation,
                      ),
                      OccupationFormField(
                        controller: provider.tecOccupation,
                        enabled: provider.currentStep == 2,
                        currentFocusNode: provider.fnOccupation,
                        nextFocusNode: provider.fnOccupation,
                      ),
                      /*provider.currentStep == 2
                          ? Row(
                              spacing: 16,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                    onPressed: () {
                                      provider.updatePage(1);
                                    },
                                    style: FilledButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        backgroundColor: Colors.white,
                                        padding: EdgeInsets.all(16),
                                        fixedSize: Size(context.mqWidth * .33 * .42, 50)),
                                    child: Text(
                                      "Voltar",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
                                    )),
                                FilledButton(
                                    onPressed: () {
                                      if (provider.formKeyAddressInfo.currentState!.validate()) {
                                        provider.updatePage(2);
                                      }
                                    },
                                    style: FilledButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                        backgroundColor: Colors.black,
                                        padding: EdgeInsets.all(16),
                                        fixedSize: Size(context.mqWidth * .33 * .42, 50)),
                                    child: Text(
                                      "Finalizar",
                                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                                    )),
                              ],
                            )
                          : const SizedBox()*/
                    ],
                  ),
                ),
              ),
            )));
  }
}
