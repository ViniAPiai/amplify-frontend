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
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: BlocBuilder<SideBarBloc, SideBarState>(
        builder: (context, state) {
          return Stack(
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
                            title: "CRM",
                            query: Crm.route,
                            icon: Icons.developer_board,
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
              if (state.showBarrier)
                ModalBarrier(
                  dismissible: state.showBarrier,
                  color: Colors.grey.shade300,
                ).setOpacity(opacity: .6),

              /**
               * Modal for adding a consultation to the calendar
               */
              if (state.showNewAppointmentModal)
                BlocProvider(
                    create: (context) => NewAppointmentBloc()..add(LoadNewAppointment(date: state.selectedDate, uuid: state.uuid)),
                    child: AnimatedPositioned(
                        right: 16,
                        bottom: 16,
                        top: 16,
                        duration: Duration(milliseconds: 500),
                        child: Container(
                            height: context.height,
                            width: 600,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                            child: NewAppointmentModal()))),

              /**
               * Modal for viewing clinical exam
               */
              if (state.showAppointmentDetailsModal)
                BlocProvider(
                    create: (context) => AppointmentDetailsBloc()..add(LoadAppointmentDetailsEvent(appointment: state.appointment)),
                    child: AnimatedPositioned(
                        right: state.showClinicalExamModal
                            ? state.appointmentDetailsModalRightPosition * (-1) + 16
                            : state.appointmentDetailsModalRightPosition,
                        bottom: 16,
                        top: 16,
                        duration: Duration(milliseconds: 500),
                        child: Container(
                            height: context.height,
                            width: 700,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                            child: AppointmentClinicalExamModal()))),

              /**
               * Modal for viewing consultation details
               */
              if (state.showAppointmentDetailsModal)
                BlocProvider(
                  create: (context) => AppointmentDetailsBloc()..add(LoadAppointmentDetailsEvent(appointment: state.appointment)),
                  child: AnimatedPositioned(
                      right: state.appointmentDetailsModalRightPosition,
                      bottom: 16,
                      top: 16,
                      duration: Duration(milliseconds: 500),
                      child: Container(
                          height: context.height,
                          width: 700,
                          decoration: BoxDecoration(color: AppColors.gray, borderRadius: BorderRadius.circular(6)),
                          child: AppointmentDetailsModal(
                            width: 700,
                          ))),
                ),

              /**
               * Modal for adding a new patient
               */
              if (state.showNewPatientModal)
                BlocProvider(
                  create: (context) {
                    if(state.patientUuid.isEmpty) {
                      print("creating new patient");
                      return SignUpBloc()..add(SignUpLoad());
                    }
                    print("editing patient");
                    print(state.patientUuid);
                    return SignUpBloc()..add(SignUpEdit(patientUuid: state.patientUuid));
                  },
                  child: AnimatedPositioned(
                      right: 16,
                      bottom: 16,
                      top: 16,
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        height: context.height,
                        width: 700,
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                        child: NewPatientModal(uuid: state.patientUuid, width: 700,),
                      )),
                ),
            ],
          );
        },
      ),
    );
  }
}
