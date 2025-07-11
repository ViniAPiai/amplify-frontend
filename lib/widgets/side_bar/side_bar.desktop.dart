part of 'side_bar.dart';

class _$SideBarDesktop extends StatefulWidget {
  final Widget child;

  const _$SideBarDesktop({super.key, required this.child});

  @override
  createState() => _SideBarDesktop();
}

class _SideBarDesktop extends State<_$SideBarDesktop> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider provider = Provider.of<SideBarProvider>(context);
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Stack(
        children: [
          /**
           * SideBar and body
           */
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 200,
                  height: context.mqHeight,
                  padding: EdgeInsets.fromLTRB(8, 32, 8, 16),
                  color: AppColors.black,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 16,
                    children: [
                      SvgPicture.asset(Assets.amplifyPrimaryGreen, height: 45),
                      const SizedBox(
                        height: 32,
                      ),
                      SideBarItem(
                        title: "Dashboard",
                        query: AgendaPage.route,
                        icon: FontAwesomeIcons.chartColumn,
                      ),
                      SideBarItem(
                        title: "Agenda",
                        query: AgendaPage.route,
                        icon: Icons.calendar_month,
                      ),
                      SideBarItem(
                        title: "Médicos",
                        query: DoctorsPage.route,
                        icon: FontAwesomeIcons.userDoctor,
                      ),
                      SideBarItem(
                        title: "Enfermeiras",
                        query: AgendaPage.route,
                        icon: FontAwesomeIcons.userNurse,
                      ),
                      SideBarItem(
                        title: "Pacientes",
                        query: PatientsPage.route,
                        icon: FontAwesomeIcons.hospitalUser,
                      ),
                      Expanded(child: Container()),
                      ListTile(
                        title: Text(
                          "Vinicius",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: context.primaryColor,
                          child: Center(
                            child: Text("V"),
                          ),
                        ),
                      ),
                      SideBarItem(
                        title: "Sair",
                        query: AgendaPage.route,
                        icon: FontAwesomeIcons.doorOpen,
                      ),
                    ],
                  )),
              Expanded(child: widget.child)
            ],
          ),
          /**
           * Barrier for any modal
           */
          provider.showBarrier
              ? ModalBarrier(
                  dismissible: provider.showBarrier,
                  color: Colors.grey.shade300,
                ).setOpacity(opacity: .6)
              : SizedBox(),
          /**
           * Modal for adding a consultation to the calendar
           */
          if (provider.showNewAppointmentModal)
            ChangeNotifierProvider(
              create: (_) => NewAppointmentProvider(date: provider.selectedDate!, uuid: provider.uuid),
              child: AnimatedPositioned(
                  right: 16,
                  bottom: 16,
                  top: 16,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                      height: context.height,
                      width: 600,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                      child: NewAppointmentModal())),
            ),

          /**
           * Modal for viewing clinical exam
           */
          if (provider.showAppointmentDetailsModal)
            ChangeNotifierProvider(
                create: (_) => AppointmentDetailsProvider(provider.appointment),
                child: AnimatedPositioned(
                    right: provider.showClinicalExamModal
                        ? provider.appointmentDetailsModalRightPosition * (-1) + 16
                        : provider.appointmentDetailsModalRightPosition,
                    bottom: 16,
                    top: 16,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                        height: context.height,
                        width: 700,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                        child: AppointmentClinicalExamModal()))),

          /**
           * Modal for viewing tooth selection
           */
          /*if (provider.showAppointmentDetailsModal)
            ChangeNotifierProvider(
                create: (_) => AppointmentDetailsProvider(provider.appointment),
                child: AnimatedPositioned(
                    right: provider.showToothSelectionModal
                        ? provider.appointmentDetailsModalRightPosition * (-1) + 16
                        : provider.showClinicalExamModal
                            ? provider.appointmentDetailsModalRightPosition - 16
                            : 16,
                    bottom: 16,
                    top: 16,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                        height: context.height,
                        width: 700,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                        child: AppointmentToothSelectedModal(width: 700)))),*/

          /**
           * Modal for viewing consultation details
           */
          if (provider.showAppointmentDetailsModal)
            ChangeNotifierProvider(
              create: (_) => AppointmentDetailsProvider(provider.appointment),
              child: AnimatedPositioned(
                  right: provider.appointmentDetailsModalRightPosition,
                  bottom: 16,
                  top: 16,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                      height: context.height,
                      width: 700,
                      decoration: BoxDecoration(color: AppColors.gray, borderRadius: BorderRadius.circular(6)),
                      child: AppointmentDetailsModal(width: 700,))),
            ),
        ],
      ),
    );
  }
}
