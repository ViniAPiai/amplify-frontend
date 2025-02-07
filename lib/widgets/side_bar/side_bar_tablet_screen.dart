part of 'side_bar_screen.dart';

class _$SideBarTabletScreen extends StatefulWidget {
  final PreferredSize? appBar;
  final Widget child;

  const _$SideBarTabletScreen({super.key, this.appBar, required this.child});

  @override
  createState() => _SideBarTabletScreen();
}

class _SideBarTabletScreen extends State<_$SideBarTabletScreen> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider provider = Provider.of<SideBarProvider>(context);
    return Scaffold(
      key: provider.key,
      appBar: widget.appBar,
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
                path: "/dashboard",
                icon: FontAwesomeIcons.chartColumn,
              ),
              SideBarItem(
                title: "Agenda",
                path: "/agenda",
                icon: Icons.calendar_month,
              ),
              SideBarItem(
                title: "Médicos",
                path: "/doctors",
                icon: FontAwesomeIcons.userDoctor,
              ),
              SideBarItem(
                title: "Enfermeiras",
                path: "/nurses",
                icon: FontAwesomeIcons.userNurse,
              ),
              SideBarItem(
                title: "Pacientes",
                path: "/patients",
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
                path: "/logout",
                icon: FontAwesomeIcons.doorOpen,
              ),
            ],
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
