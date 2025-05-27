part of 'new_appointment.dart';

class _NewAppointmentTablet extends StatelessWidget {
  const _NewAppointmentTablet();

  @override
  Widget build(BuildContext context) {
    NewAppointmentProvider provider = Provider.of<NewAppointmentProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    return SideBar(
        appBar: PreferredSize(
          preferredSize: Size(context.mqWidth, 100),
          child: Container(
            color: AppColors.gray,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: IconButton(
                        onPressed: () => sideBarProvider.key.currentState!.openDrawer(),
                        icon: Icon(
                          Icons.menu,
                          color: AppColors.grayBlack,
                          size: 32,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Icon(
                      Icons.calendar_month,
                      color: context.primaryColor,
                      size: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      t.newAppointment,
                      style: GoogleFonts.inter(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        child: provider.isLoadingAppointmentTypes || provider.isLoadingProcedureTypes || provider.isLoadingDoctors || provider.isRegistering
            ? Center(
                child: CircularProgressIndicator(),
              ).expanded()
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   /* PatientSelectionFormField(
                        enabled: !provider.isFinished, onChanged: (value) => provider.updatePatient(value), model: provider.patient),
                    Label(label: t.appointmentType),
                    DropdownButtonFormField<AppointmentTypeModel>(
                      value: provider.appointmentType,
                      items: provider.appointmentTypes.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          );
                        },
                      ).toList(),
                      onChanged: (value) => provider.updateAppointmentType(value!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
                        ),
                      ),
                    ),
                    Label(label: t.doctorLabel),
                    DropdownButtonFormField<UserModel>(
                      value: provider.doctor,
                      items: provider.doctors.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.fullName),
                          );
                        },
                      ).toList(),
                      onChanged: (value) => provider.updateDoctor(value!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
                        ),
                      ),
                    ),
                    Label(label: t.procedures),
                    DropdownButtonFormField<ProcedureTypeModel>(
                      items: provider.procedureTypes.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.name),
                          );
                        },
                      ).toList(),
                      onChanged: (value) => provider.addProcedureType(value!),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
                        ),
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children: provider.selectedProcedureTypes
                          .map(
                            (e) => Chip(
                              label: Text(e.name),
                              onDeleted: () => provider.removeProcedureType(e),
                            ),
                          )
                          .toList(),
                    ),*/
                    Label(label: t.datesAndTimes),
                    /*Column(
                      spacing: 8,
                      children: List.generate(
                        provider.dates.length,
                        (index) {
                          return Row(
                            spacing: 16,
                            children: [
                              DatePickerButton(
                                enabled: false,
                                date: provider.dates[index],
                                onChanged: (value) => provider.updateDate(index, value),
                                index: index,
                              ).expanded(),
                              TimePickerButton(
                                enabled: false,
                                label: t.beginTimeLabel,
                                time: provider.startTimes[index],
                                onChanged: (value) => provider.updateStartTime(index, value),
                                index: index,
                              ).expanded(),
                              TimePickerButton(
                                enabled: false,
                                label: t.endTimeLabel,
                                time: provider.endTimes[index],
                                onChanged: (value) => provider.updateEndTime(index, value),
                                index: index,
                              ).expanded(),
                              provider.dates.length > 1
                                  ? RemoveButton(
                                      onPressed: () => provider.removeDateAndTime(index),
                                      index: index,
                                    )
                                  : const SizedBox(),
                            ],
                          );
                        },
                      ),
                    ),
                    AddDateButton(onPressed: () => provider.addDateAndTime()),*/
                    Label(label: t.teeth),
                    /*Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      runAlignment: WrapAlignment.start,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      children: [
                        ...List.generate(
                          8,
                              (index) => 11 + index,
                        ),
                        ...List.generate(
                          8,
                              (index) => 21 + index,
                        ),
                        ...List.generate(
                          8,
                              (index) => 31 + index,
                        ),
                        ...List.generate(
                          8,
                              (index) => 41 + index,
                        )
                      ].map(
                            (e) {
                          return ChoiceChip(
                              label: Text((e).toString()),
                              selected: provider.teethSelected.contains(e),
                              padding: e < 20 ? EdgeInsets.symmetric(horizontal: 9.2, vertical: 8) : EdgeInsets.all(8),
                              // padding: EdgeInsets.all(8),
                              onSelected: (value) {
                                if (value) {
                                  provider.addTeeth(e);
                                } else {
                                  provider.removeTeeth(e);
                                }
                              });
                        },
                      ).toList(),
                    ),*/
                    Label(label: t.descriptionLabel),
                    TextFormField(
                      controller: provider.tecNotes,
                      maxLines: 10,
                      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                    ).expanded(),
                    Row(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () => context.router.pop(false),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.error, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          child: Text(
                            t.cancel,
                            style: GoogleFonts.montserrat(fontSize: 16, color: AppColors.error),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () => provider.addAppointment(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.secondary, width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            backgroundColor: AppColors.secondary,
                          ),
                          child: Text(
                            t.register,
                            style: GoogleFonts.montserrat(fontSize: 16, color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ));
  }
}
