part of 'new_appointment.dart';

class _NewAppointmentTablet extends StatelessWidget {

  const _NewAppointmentTablet();

  @override
  Widget build(BuildContext context) {
    NewAppointmentProvider provider = Provider.of<NewAppointmentProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    return SideBar(
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.gray,
        )
    );
  }
}