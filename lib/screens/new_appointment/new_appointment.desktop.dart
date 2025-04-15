part of 'new_appointment.dart';

class _NewAppointmentDesktop extends StatelessWidget {

  const _NewAppointmentDesktop();

  @override
  Widget build(BuildContext context) {
    NewAppointmentProvider provider = Provider.of<NewAppointmentProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.gray,
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              HeaderTitle(icon: FontAwesomeIcons.calendarCheck, title: "Nova Consulta"),
              PatientSelectionFormField(
                  enabled: !provider.isFinished, onChanged: (value) => provider.updatePatient(value), model: provider.patient),
            ],
          ),
        )
    );
  }
}