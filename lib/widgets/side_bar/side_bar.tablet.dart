part of 'side_bar.dart';

class _$SideBarTablet extends StatefulWidget {
  final PreferredSize? appBar;
  final Widget? bottom;
  final Widget child;

  const _$SideBarTablet({this.appBar, required this.child, this.bottom});

  @override
  createState() => _SideBarTablet();
}

class _SideBarTablet extends State<_$SideBarTablet> {
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SideBarBloc bloc = context.read<SideBarBloc>();
    return BlocListener<SideBarBloc, SideBarState>(
      listener: (context, state) {
        if (state.shouldOpenSideBar) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            key.currentState?.openDrawer();
          });
        }
      },
      child: BlocBuilder<SideBarBloc, SideBarState>(
        builder: (context, state) {
          return Scaffold(
            key: key,
            appBar: state.showNewAppointmentModal || state.showAppointmentDetailsModal || state.showNewPatientModal ? null : widget.appBar,
            backgroundColor: AppColors.gray,
            drawer: Drawer(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    SvgPicture.asset(Assets.amplifyPrimaryGreen, height: 70),
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
                ),
              ),
            ),
            body: BlocBuilder<SideBarBloc, SideBarState>(
              builder: (context, state) {
                return Stack(
                  children: [
                    widget.child,
                    /**
                     * Modal for adding a appointment to the calendar
                     */
                    if (state.showNewAppointmentModal)
                      BlocProvider(
                          create: (context) => NewAppointmentBloc()..add(LoadNewAppointment(date: state.selectedDate, uuid: state.uuid)),
                          child: AnimatedPositioned(
                              bottom: 0,
                              top: null,
                              duration: Duration(milliseconds: 500),
                              child: Container(height: context.height, width: context.width, color: Colors.white, child: NewAppointmentModal()))),

                    /**
                     * Modal for viewing consultation details
                     */
                    if (state.showAppointmentDetailsModal)
                      BlocProvider(
                        create: (context) => AppointmentDetailsBloc()..add(LoadAppointmentDetailsEvent(appointment: state.appointment)),
                        child: AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            child: Container(
                                height: context.height,
                                width: context.width,
                                decoration: BoxDecoration(color: AppColors.gray, borderRadius: BorderRadius.circular(6)),
                                child: state.showClinicalExamModal
                                    ? AppointmentClinicalExamModal()
                                    : AppointmentDetailsModal(
                                        width: context.width,
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
                            duration: Duration(milliseconds: 500),
                            child: Container(
                              height: context.height,
                              width: context.width,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
                              child: NewPatientModal(uuid: state.patientUuid, width: context.width,),
                            )),
                      ),
                  ],
                );
              }
            ),
            bottomNavigationBar: widget.bottom,
          );
        }
      ),
    );
  }
}
