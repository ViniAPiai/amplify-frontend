part of 'appointment_details.modal.dart';

class AppointmentDetailsMobile extends StatelessWidget {
  const AppointmentDetailsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    AppointmentModel appointment = provider.appointment;
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Detalhes da Consulta",
              style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w700),
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
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                )),
            RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text:
                        "${appointment.patient!.fullName.length > 15 ? ("${appointment.patient?.fullName.substring(0, 15)}...") : appointment.patient?.fullName}",
                    style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(
                          text:
                              "\n${appointment.patient!.email!.length > 15 ? ("${appointment.patient?.email!.substring(0, 15)}...") : appointment.patient?.email}",
                          style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400)),
                    ])),
            Spacer(),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<String>(
                    value: "arrived",
                    child: Text("Chegou"),
                  ),
                  const PopupMenuItem<String>(
                    value: "reschedule",
                    child: Text("Remarcar"),
                  ),
                  const PopupMenuItem<String>(
                    value: "edit",
                    child: Text("Editar"),
                  ),
                ];
              },
            )
          ],
        ),
        Divider(),
        Row(children: [
          _tabButton(index: 0, context: context, icon: Icons.info),
          _tabButton(index: 1, context: context, icon: Icons.person),
          _tabButton(index: 2, context: context, icon: Icons.medical_services),
          _tabButton(index: 3, context: context, icon: FontAwesomeIcons.tooth)
        ]),
        Divider(),
        _tabView(context: context)[provider.selectedTab],
        // _tabView(context: context)[provider.selectedTab],
        IgnorePointer(
          ignoring: sideBarProvider.showClinicalExamModal,
          child: OutlinedButton.icon(
            onPressed: () => sideBarProvider.openOrCloseClinicalExamModal(),
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6), side: BorderSide(style: BorderStyle.solid)),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                fixedSize: Size(context.width, 50)),
            label: Text(provider.appointment.clinicalExam!.uuid.isEmpty ? "Adicionar informações médicas" : "Atualizar/Exibir informações médicas",
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
                fixedSize: Size(context.width, 50)),
            child: Text("Finalizar", style: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
        )
      ],
    ).paddingAll(8);
  }

  Widget _tile({required BuildContext context, required String value, required String field, required IconData icon, bool showIcon = true}) {
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
            Text(value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(field, style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w300, color: AppColors.grayBlack)),
          ],
        ).expanded(),
      ],
    );
  }

  Widget _tabButton({required int index, required BuildContext context, required IconData icon}) {
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    List<String> titles = ["Informações", "Paciente", "Dados médicos", "Dentes"];
    return TextButton.icon(
        onPressed: () => provider.changeSelectedTab(index),
        label: Text(provider.selectedTab == index ? titles[index] : '',
            style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black)),
        icon: Icon(icon, color: provider.selectedTab == index ? AppColors.primary : AppColors.grayBlack, size: 24));
  }

  List<Widget> _tabView({required BuildContext context}) {
    AppointmentDetailsProvider provider = Provider.of<AppointmentDetailsProvider>(context);
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    AppointmentModel appointment = provider.appointment;
    DateFormat dateFormat = DateFormat.yMMMd(localeProvider.locale.toString());
    return [
      ListView(
        children: [
          _tile(context: context, value: "Teste", field: "Tipo de Consulta", icon: FontAwesomeIcons.fileMedical),
          _tile(
              context: context,
              value: "${context.timeOfDayString(appointment.startTime)} - ${context.timeOfDayString(appointment.endTime)}",
              field: "Horário",
              icon: FontAwesomeIcons.clock),
          _tile(context: context, value: appointment.doctor!.fullName, field: "Dentista", icon: FontAwesomeIcons.userDoctor),
          _tile(context: context, value: dateFormat.format(appointment.date), field: "Data", icon: FontAwesomeIcons.calendar),
          _tile(
              context: context,
              value: appointment.nurse == null ? "Nenhuma" : appointment.nurse!.fullName,
              field: "Enfermeira",
              icon: FontAwesomeIcons.userNurse),
          _tile(
              context: context,
              value: appointment.teeth!.map((e) => e.name.replaceAll('T_', '')).join(", "),
              field: "Dentes",
              icon: FontAwesomeIcons.tooth),
          _tile(context: context, value: "Obturação, Remoção de dente", field: "Procedimentos", icon: FontAwesomeIcons.fileSignature),
        ],
      ).expanded(),
      ListView(
        children: [
          _tile(context: context, value: appointment.patient!.fullName, field: "Nome Completo", icon: FontAwesomeIcons.hospitalUser),
          _tile(context: context, value: appointment.patient!.email!, field: "E-mail", icon: FontAwesomeIcons.envelope),
          _tile(context: context, value: appointment.patient!.phoneNumber, field: "Celular", icon: FontAwesomeIcons.phone),
          _tile(context: context, value: "08/07/1999", field: "Data de Nascimento", icon: FontAwesomeIcons.calendarDay),
          _tile(context: context, value: "Masculino", field: "Sexo", icon: FontAwesomeIcons.genderless),
          _tile(context: context, value: "123912831", field: "Documento", icon: FontAwesomeIcons.idCard),
        ],
      ).expanded(),
      ListView(
        children: [SizedBox()],
      ).expanded(),
      CustomPaint(
        painter: DentalArchPainter(
          selectedTeeth: appointment.teeth ?? [],
          toothPaths: TeethPaths.teethPaths,
          scale: .8
        ),
      ).paddingSymmetric(horizontal: context.width * .18).expanded()
    ];
  }
}
