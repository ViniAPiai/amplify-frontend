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
              create: (_) => NewAppointmentProvider(provider.selectedDate!),
              child: AnimatedPositioned(
                  right: 0,
                  left: null,
                  duration: Duration(milliseconds: 500),
                  child: Container(height: context.height, width: 600, color: Colors.white, child: NewAppointmentModal())),
            )
        ],
      ),
    );
  }
}
