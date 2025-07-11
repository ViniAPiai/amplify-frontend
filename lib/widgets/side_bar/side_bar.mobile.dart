part of 'side_bar.dart';

class _$SideBarMobile extends StatefulWidget {
  final PreferredSize? appBar;
  final Widget? bottom;
  final Widget child;

  const _$SideBarMobile({this.appBar, required this.child, this.bottom});

  @override
  createState() => _SideBarMobile();
}

class _SideBarMobile extends State<_$SideBarMobile> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider provider = Provider.of<SideBarProvider>(context);
    return Scaffold(
      key: provider.key,
      appBar: provider.showNewAppointmentModal || provider.showAppointmentDetailsModal ? null : widget.appBar,
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
      body: Stack(
        children: [
          widget.child,
          /**
           * Modal for adding a appointment to the calendar
           */
          if (provider.showNewAppointmentModal)
            ChangeNotifierProvider(
                create: (_) => NewAppointmentProvider(date: provider.selectedDate!, uuid: provider.uuid),
                child: AnimatedPositioned(
                    bottom: 0,
                    top: null,
                    duration: Duration(milliseconds: 500),
                    child: Container(height: context.height, width: context.width, color: Colors.white, child: NewAppointmentModal()))),

          /**
           * Modal for viewing consultation details
           */
          if (provider.showAppointmentDetailsModal)
            ChangeNotifierProvider(
              create: (_) => AppointmentDetailsProvider(provider.appointment),
              child: AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  child: Container(
                      height: context.height,
                      width: context.width,
                      decoration: BoxDecoration(color: AppColors.gray, borderRadius: BorderRadius.circular(6)),
                      child: provider.showClinicalExamModal ? AppointmentClinicalExamModal() : AppointmentDetailsModal(width: context.width,))),
            ),
        ],
      ),
      bottomNavigationBar: widget.bottom,
    );
  }
}
