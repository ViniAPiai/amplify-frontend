part of 'patient_detail_screen.dart';

class _PatientDetailMobileScreen extends StatelessWidget {

  const _PatientDetailMobileScreen();

  @override
  Widget build(BuildContext context) {
    PatientDetailProvider provider = Provider.of<PatientDetailProvider>(context);
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