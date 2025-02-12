part of 'side_bar_screen.dart';

class _$SideBarDesktopScreen extends StatefulWidget {
  final Widget child;

  const _$SideBarDesktopScreen({super.key, required this.child});

  @override
  createState() => _SideBarDesktopScreen();
}

class _SideBarDesktopScreen extends State<_$SideBarDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider provider = Provider.of<SideBarProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Row(
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
              )),
          Expanded(child: widget.child)
        ],
      ),
    );
  }
}
