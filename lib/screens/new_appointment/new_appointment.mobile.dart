part of 'new_appointment.dart';

class _NewAppointmentMobile extends StatelessWidget {
  const _NewAppointmentMobile();

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
                    style: GoogleFonts.inter(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: Container(
        height: 70,
        width: context.width,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          spacing: 16,
          children: [
            LinearProgressIndicator(
              value: provider.progress,
              color: AppColors.secondary,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                provider.page > 0
                    ? IconButton(
                        onPressed: () => provider.previousPage(),
                        icon: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          color: AppColors.grayBlack,
                        ))
                    : SizedBox().expanded(),
                IconButton(
                    onPressed: () => provider.nextPage(),
                    icon: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: AppColors.grayBlack,
                    )),
              ],
            )
          ],
        ),
      ),
      child: provider.isLoadingAppointmentTypes ||
              provider.isLoadingProcedureTypes ||
              provider.isLoadingDoctors || /*provider.isLoadingPatients ||*/
              provider.isRegistering
          ? Center(
              child: CircularProgressIndicator(),
            ).expanded()
          : PageView(
              controller: provider.pageController,
              scrollDirection: Axis.horizontal,
              allowImplicitScrolling: false,
              pageSnapping: false,
              physics: NeverScrollableScrollPhysics(),
              children: [
                /*Container(
                    padding: const EdgeInsets.all(16.0),
                    width: context.width,
                    height: context.height,
                    child: Column(
                      spacing: 16,
                      children: [
                        TextFormField(
                            onChanged: (value) => provider.filterPatients(value),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                                suffixIcon: Icon(
                                  FontAwesomeIcons.filter,
                                  color: AppColors.grayBlack,
                                ))),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          color: Colors.white,
                          child: ListView.separated(
                            itemCount: provider.filteredPatients.length,
                            itemBuilder: (context, index) {
                              UserModel patient = provider.filteredPatients[index];
                              return ListTile(
                                  title: Text(
                                    patient.fullName,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: provider.patient.uuid == patient.uuid ? FaIcon(Icons.check_circle, color: AppColors.secondary) : null,
                                  onTap: () => provider.updatePatient(patient));
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Divider(
                                color: AppColors.gray2,
                                indent: 16,
                                endIndent: 16,
                              );
                            },
                          ),
                        ).expanded(),
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
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
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
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
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
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
                      ),
                    ],
                  ),
                ),*/
                /*Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16,
                      children: [
                        Label(label: t.datesAndTimes),
                        Column(
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
                        AddDateButton(onPressed: () => provider.addDateAndTime()),
                      ],
                    )),*/
                /*Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      Label(label: t.teeth),
                      Wrap(
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
                      ),
                    ],
                  ),
                ),*/
                Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(spacing: 16, children: [
                      Label(label: t.descriptionLabel),
                      TextFormField(
                        controller: provider.tecNotes,
                        maxLines: 10,
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
                      ).expanded(),
                    ])),
              ],
            ),
    );
  }
}
