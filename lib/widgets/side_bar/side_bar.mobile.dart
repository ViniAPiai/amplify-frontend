part of 'side_bar.dart';

class _$SideBarMobile extends StatefulWidget {

  final PreferredSize? appBar;
  final Widget child;

  const _$SideBarMobile({this.appBar, required this.child});

  @override
  createState() => _SideBarMobile();
}

class _SideBarMobile extends State<_$SideBarMobile> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider provider = Provider.of<SideBarProvider>(context);
    AgendaProvider agendaProvider = Provider.of<AgendaProvider>(context);
    return Scaffold(
      key: provider.key,
      appBar: agendaProvider.showBarrier ? null : widget.appBar,
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
            children:  [
              const SizedBox(
                height: 32,
              ),
              SvgPicture.asset(Assets.amplifyPrimaryGreen, height: 70),
              const SizedBox(
                height: 32,
              ),
              SideBarItem(
                title: "Dashboard",
                query: AgendaPage.query(),
                icon: FontAwesomeIcons.chartColumn,
              ),
              SideBarItem(
                title: "Agenda",
                query: AgendaPage.query(),
                icon: Icons.calendar_month,
              ),
              SideBarItem(
                title: "Médicos",
                query: DoctorsPage.query(),
                icon: FontAwesomeIcons.userDoctor,
              ),
              SideBarItem(
                title: "Enfermeiras",
                query: AgendaPage.query(),
                icon: FontAwesomeIcons.userNurse,
              ),
              SideBarItem(
                title: "Pacientes",
                query: PatientsPage.query(),
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
                query: AgendaPage.query(),
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
           * Barrier for any modal
           */
          agendaProvider.showBarrier
              ? ModalBarrier(
            dismissible: agendaProvider.showBarrier,
            color: Colors.grey.shade300,
          ).setOpacity(opacity: .6)
              : SizedBox(),
          /**
           * Modal for adding a consultation to the calendar
           */
          agendaProvider.showConsultationModal
              ? ConsultationModal()
              : SizedBox()
        ],
      ),
    );
  }
}