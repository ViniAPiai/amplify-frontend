part of 'new_appointment_screen.dart';

class _NewAppointmentTabletScreen extends StatelessWidget {

  const _NewAppointmentTabletScreen();

  @override
  Widget build(BuildContext context) {
    NewAppointmentProvider provider = Provider.of<NewAppointmentProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    return SideBarScreen(
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.gray,
        )
    );
  }
}