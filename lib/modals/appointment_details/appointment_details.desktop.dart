part of 'appointment_details.modal.dart';

class AppointmentDetailsDesktop extends StatelessWidget {
  const AppointmentDetailsDesktop({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    DateFormat dateFormat = DateFormat.yMMMd(localeProvider.locale.toString());
    AppointmentModel appointment = provider.appointment;
    List<String> titles = ["Informações", "Dados do paciente", "Dados médicos", "Dentes Selecionados"];
    return Row(
      children: [
        Container(
          height: context.height,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(6)),
          ),
          child: Column(
            spacing: 16,
            children: [
              SizedBox(
                height: 16,
              ),
              _tabButton(index: 0, context: context, icon: Icons.info),
              _tabButton(index: 1, context: context, icon: Icons.person),
              _tabButton(index: 2, context: context, icon: Icons.medical_services),
              _tabButton(index: 3, context: context, icon: FontAwesomeIcons.tooth),
            ],
          ),
        ),
        Container(
          height: context.height,
          width: width - 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(left: Radius.circular(6), right: Radius.circular(6)),
          ),
          padding: const EdgeInsets.all(32),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Detalhes da Consulta",
                    style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  IconButton(onPressed: () => sideBarProvider.openOrCloseAppointmentDetailsModal(context: context, uuid: ''), icon: Icon(Icons.close))
                ],
              ),
              Divider(),
              Row(
                spacing: 16,
                children: [
                  SizedBox(
                      height: 75,
                      width: 75,
                      child: CircleAvatar(
                        backgroundColor: Colors.amber,
                      )),
                  RichText(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                          text:
                              "${appointment.patient!.fullName.length > 15 ? ("${appointment.patient?.fullName.substring(0, 15)}...") : appointment.patient?.fullName}",
                          style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
                          children: [
                            TextSpan(
                                text:
                                    "\n${appointment.patient!.email!.length > 40 ? ("${appointment.patient?.email!.substring(0, 15)}...") : appointment.patient?.email}",
                                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400)),
                          ])),
                ],
              ).paddingSymmetric(vertical: 16),
              Row(
                spacing: 16,
                children: [
                  if (appointment.status == AppointmentStatusEnum.scheduled)
                    FilledButton.icon(
                      onPressed: () => provider.patientArrived(),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      icon: Icon(Icons.check_circle, color: Colors.white, size: 16),
                      label: Text("Presente", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700)),
                    ).expanded(),
                  if(appointment.status == AppointmentStatusEnum.inProgress)
                    FilledButton.icon(
                      onPressed: () => provider.patientArrived(),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      icon: Icon(Icons.check_circle, color: Colors.white, size: 16),
                      label: Text("Iniciar", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700)),
                    ).expanded(),
                  if (appointment.status == AppointmentStatusEnum.scheduled ||
                      appointment.status == AppointmentStatusEnum.waitingForClinicConfirmation)
                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      ),
                      icon: Icon(Icons.schedule_rounded, color: AppColors.grayBlack, size: 16),
                      label: Text("Remarcar", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.grayBlack)),
                    ).expanded(),
                  ElevatedButton.icon(
                    onPressed: () => sideBarProvider.openEditAppointmentModal(context: context, uuid: provider.appointment.uuid!),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    icon: Icon(FontAwesomeIcons.pencil, color: AppColors.grayBlack, size: 16),
                    label: Text("Editar", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.grayBlack)),
                  ).expanded()
                ],
              ),
              Row(
                spacing: 16,
                children: [
                  Text(
                    titles[provider.selectedTab],
                    style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Divider().expanded()
                ],
              ),
              _tabView(context: context),
              IgnorePointer(
                ignoring: sideBarProvider.showClinicalExamModal,
                child: OutlinedButton.icon(
                  onPressed: () => sideBarProvider.openOrCloseClinicalExamModal(),
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: BorderSide(style: BorderStyle.solid)),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      fixedSize: Size(width - 50, 50)),
                  label: Text(
                      provider.appointment.clinicalExam!.uuid.isEmpty ? "Adicionar informações médicas" : "Atualizar/Exibir informações médicas",
                      style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.grayBlack)),
                  icon: Icon(Icons.medical_information, color: AppColors.grayBlack),
                ),
              ),
              IgnorePointer(
                ignoring: provider.appointment.clinicalExam!.uuid.isEmpty,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: provider.appointment.clinicalExam!.uuid.isEmpty ? AppColors.gray2 : AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      fixedSize: Size(width - 50, 50)),
                  child: Text("Finalizar", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _tile(String value, String field, IconData icon, {bool showIcon = true}) {
    return Row(
      spacing: 16,
      children: [
        if (showIcon)
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.gray,
            ),
            child: Icon(icon, size: 20, color: AppColors.grayBlack).toCenter(),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w600)),
            Text(field, style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w300, color: AppColors.grayBlack)),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _tabButton({required int index, required BuildContext context, required IconData icon}) {
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    return IgnorePointer(
      ignoring: sideBarProvider.showClinicalExamModal,
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: IconButton(
              onPressed: () => provider.changeSelectedTab(index),
              icon: Icon(
                icon,
                color: provider.selectedTab == index ? AppColors.primary : AppColors.grayBlack,
                size: 24,
              ))),
    );
  }

  Widget _tabView({required BuildContext context}) {
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    AppointmentModel appointment = provider.appointment;
    DateFormat dateFormat = DateFormat.yMMMd(localeProvider.locale.toString());
    if (provider.selectedTab == 0) {
      return Column(
        children: [
          Row(
            children: [
              // First column
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _tile(appointment.appointmentType!.name.name, "Tipo de Consulta", FontAwesomeIcons.fileMedical),
                  _tile("${context.timeOfDayString(appointment.startTime)} - ${context.timeOfDayString(appointment.endTime)}", "Horário",
                      FontAwesomeIcons.clock),
                  _tile(appointment.doctor!.fullName, "Dentista", FontAwesomeIcons.userDoctor)
                ],
              ).expanded(),
              // Second column
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _tile(dateFormat.format(appointment.date), "Data", FontAwesomeIcons.calendar),
                  _tile(appointment.nurse == null ? "Nenhuma" : appointment.nurse!.fullName, "Enfermeira", FontAwesomeIcons.userNurse),
                  _tile(appointment.teeth!.map((e) => e.name.replaceAll('T_', '')).join(", "), "Dentes", FontAwesomeIcons.tooth),
                ],
              ).expanded(),
            ],
          ),
          _tile((appointment.procedureTypes ?? []).map((e) => e.name.name,).join(', '), "Procedimentos", FontAwesomeIcons.fileSignature),
        ],
      ).expanded();
    }
    if (provider.selectedTab == 1) {
      return Row(
        children: [
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _tile(appointment.patient!.fullName, "Nome Completo", FontAwesomeIcons.hospitalUser),
              _tile(appointment.patient!.email!, "E-mail", FontAwesomeIcons.envelope),
              _tile(appointment.patient!.phoneNumber, "Celular", FontAwesomeIcons.phone),
            ],
          ).expanded(),
          Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _tile("08/07/1999", "Data de Nascimento", FontAwesomeIcons.calendarDay),
              _tile("Masculino", "Sexo", FontAwesomeIcons.genderless),
              _tile("123912831", "Documento", FontAwesomeIcons.idCard),
            ],
          ).expanded(),
        ],
      ).expanded();
    }
    if (provider.selectedTab == 2) {
      return SizedBox().expanded();
    }
    return CustomPaint(
      painter: DentalArchPainter(
        selectedTeeth: appointment.teeth ?? [],
        toothPaths: TeethPaths.teethPaths,
      ),
    ).paddingSymmetric(horizontal: width * .2).expanded();
  }
}
