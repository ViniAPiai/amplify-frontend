part of 'patient_detail.dart';

class _PatientDetailDesktop extends StatelessWidget {
  const _PatientDetailDesktop({required this.patientUuid});

  final String patientUuid;

  @override
  Widget build(BuildContext context) {
    PatientDetailProvider provider = Provider.of<PatientDetailProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
        child: FutureBuilder<PatientModel>(
            future: PatientService().findById(patientUuid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator(color: AppColors.secondary));
              }
              PatientModel patient = snapshot.data!;
              return SizedBox(
                width: context.width,
                height: context.height,
                child: Column(
                  spacing: 16,
                  children: [
                    Container(
                      width: context.width,
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                      child: Row(
                        spacing: 16,
                        children: [
                          HeaderTitle(icon: Icons.person_outlined, title: patient.fullName.split(" ").first),
                          /*ToggleSwitch(
                            minWidth: 185,
                            minHeight: 50,
                            initialLabelIndex: provider.selectedIndex,
                            totalSwitches: 2,
                            inactiveBgColor: AppColors.gray,
                            inactiveFgColor: Colors.grey.shade400,
                            activeBgColor: [AppColors.gray],
                            activeFgColor: context.primaryColor,
                            labels: [t.basicInfo, t.medicalRecord],
                            customTextStyles: [GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500)],
                            onToggle: (index) => provider.toggle(index!),
                            cornerRadius: 12,
                          ),*/
                          SizedBox().expanded(),
                          NewButton(
                            onPressed: () => context.router.push(NewPatientPage.query())
                          ),
                        ],
                      ),
                    ),
                    Container(
                        width: context.width,
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                        child: Row(
                          spacing: 16,
                          children: [
                            Text(
                              t.patientList,
                              style: GoogleFonts.inter(color: AppColors.secondary, fontSize: 24, fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.arrow_forward_ios, color: AppColors.gray2, size: 24),
                            Text(
                              patient.fullName.split(' ').first,
                              style: GoogleFonts.inter(color: AppColors.gray2, fontSize: 24, fontWeight: FontWeight.w400),
                            ),
                            SizedBox().expanded(),
                            RefreshButton(),
                            PrinterButton(),
                            NewConsultationButton()
                          ],
                        )),
                    // _chooseView(context, provider, patient, t)
                    _patientInfo(context, provider, patient, t),
                    _medicalHistory(context, provider, patient, t)
                  ],
                ),
              );
            }));
    }

  Widget _chooseView(BuildContext context, PatientDetailProvider provider, PatientModel patient, AppLocalizations t) {
    switch (provider.selectedIndex) {
      case 0:
          return _patientInfo(context, provider, patient, t);
      case 1:
          return _medicalHistory(context, provider, patient, t);
      default:
          return _patientInfo(context, provider, patient, t);
    }
  }

  Widget _patientInfo(BuildContext context, PatientDetailProvider provider, PatientModel patient, AppLocalizations t) {
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    return Container(
        width: context.width - 260,
        padding: EdgeInsets.fromLTRB(36, 16, 36, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  backgroundColor: AppColors.secondary,
                )),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: patient.fullName,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [
                    TextSpan(
                      text: "\n\n${patient.email}",
                      style: GoogleFonts.inter(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ]),
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [InfoShower(label: t.gender, value: patient.gender),
                    InfoShower(
                        label: t.birthDate, value: DateFormat.yMMMMd(locale.getLocaleString()).format(patient.birthDate)),
                    InfoShower(label: t.documentNumber, value: patient.documentNumber!),],
                ).expanded(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoShower(label: t.healthNumber, value: patient.healthNumber),
                    InfoShower(label: t.street, value: patient.address.street),
                    InfoShower(label: t.number, value: patient.address.number),
                  ],
                ).expanded(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoShower(label: t.complement, value: patient.address.neighborhood),
                    InfoShower(label: t.city, value: patient.address.city),
                    InfoShower(label: t.state, value: patient.address.state),
                  ],
                ).expanded(),
              ],
            ),
          ],
        ));
  }

  Widget _medicalHistory(BuildContext context, PatientDetailProvider provider, PatientModel patient, AppLocalizations t) {
    return Container(
        width: context.width - 260,
        padding: EdgeInsets.fromLTRB(36, 16, 36, 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: FutureBuilder<MedicalHistoryModel>(
          future: MedicalHistoryService().findByPatientUuid('12391239123'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(color: AppColors.secondary));
            }
            MedicalHistoryModel medicalHistory = snapshot.data!;
            return Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  spacing: 16,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Icon(
                        Icons.medical_information_outlined,
                        color: context.primaryColor,
                        size: 32,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        t.medicalRecord,
                        style: GoogleFonts.inter(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoShower(label: t.hasDiabetes, value: medicalHistory.hasDiabetes ? t.yes : t.no),
                        InfoShower(label: t.hasHypertension, value: medicalHistory.hasHypertension ? t.yes : t.no),
                        InfoShower(label: t.hasHeartProblems, value: medicalHistory.hasHeartProblems ? t.yes : t.no),
                        InfoShower(label: t.hasEpilepsy, value: medicalHistory.hasEpilepsy ? t.yes : t.no),
                      ],
                    ).expanded(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoShower(label: t.hasAsthma, value: medicalHistory.hasAsthma ? t.yes : t.no),
                        InfoShower(label: t.hasOsteoporosis, value: medicalHistory.hasOsteoporosis ? t.yes : t.no),
                        InfoShower(label: t.hasAnestheticAllergy, value: medicalHistory.hasAnestheticAllergy ? t.yes : t.no),
                        InfoShower(label: t.hasBleedingIssues, value: medicalHistory.hasBleedingIssues ? t.yes : t.no),
                      ],
                    ).expanded(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoShower(label: t.allergies, value: medicalHistory.allergies ?? ''),
                        InfoShower(label: t.medications, value: medicalHistory.medications ?? ''),
                        InfoShower(label: t.surgeries, value: medicalHistory.surgeries ?? ''),
                        InfoShower(label: t.isPregnant, value: medicalHistory.isPregnant ? t.yes : t.no),
                      ],
                    ).expanded(),
                  ],
                ),
              ],
            );
          }
        ));
  }


}
