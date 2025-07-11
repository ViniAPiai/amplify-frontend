part of 'patients.dart';

class _$PatientsDesktop extends StatelessWidget {
  const _$PatientsDesktop();

  @override
  Widget build(BuildContext context) {
    PatientsProvider provider = Provider.of<PatientsProvider>(context);
    AgendaProvider agendaProvider = Provider.of<AgendaProvider>(context);
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
      child: Container(
        width: context.width,
        height: context.height,
        color: AppColors.gray,
        child: Column(
          spacing: 16,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
              child: Row(
                spacing: 16,
                children: [
                  HeaderTitle(icon: Icons.person_3, title: t.patientList),
                  Expanded(child: SizedBox()),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      controller: provider.tecSearch,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        hintText: AppLocalizations.of(context)!.searchPatientHint,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => provider.search(),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: context.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: EdgeInsets.all(16)),
                    label: Text(
                      AppLocalizations.of(context)!.search,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  OutlinedButton.icon(
                      onPressed: () => context.go(NewPatientPage.route),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: context.primaryColor)),
                        padding: EdgeInsets.all(16)),
                    label: Text(
                      AppLocalizations.of(context)!.newPatient,
                      style: GoogleFonts.inter(
                        color: context.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    icon: Icon(
                      Icons.add,
                      color: context.primaryColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
            provider.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ).expanded()
                : provider.hasContent()
                    ? Column(spacing: 16, children: [
                        Container(
                          width: context.width,
                          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                          decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
                          child: Row(
                            spacing: 16,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "${provider.patients.totalItems}",
                                      style: GoogleFonts.inter(
                                        color: context.primaryColor,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      children: [
                                    TextSpan(
                                        text: " ${t.patientsLabel}",
                                        style: GoogleFonts.inter(
                                          color: AppColors.gray2,
                                          fontSize: 20,
                                        ))
                                  ])),
                              VerticalDivider(
                                thickness: .5,
                              ),
                              Text(
                                t.sortBy,
                                style: GoogleFonts.inter(color: AppColors.gray2, fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Expanded(child: SizedBox()),
                              PrinterButton(),
                              FilterButton()
                            ],
                          ),
                        ),
                        Container(
                            width: context.mqWidth,
                            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                            child: SingleChildScrollView(
                              child: DataTable(
                                  showCheckboxColumn: true,
                                  dataRowMinHeight: 100,
                                  dataRowMaxHeight: 100,
                                  columns: [
                                    DataColumn(
                                        label: Label(
                                      label: t.basicInfo,
                                      required: false,
                                    )),
                                    DataColumn(
                                        label: Label(
                                      label: t.documentNumber,
                                      required: false,
                                    )),
                                    DataColumn(
                                        label: Label(
                                      label: t.healthNumber,
                                      required: false,
                                    )),
                                    DataColumn(
                                        label: Label(
                                      label: t.phoneNumber,
                                      required: false,
                                    )),
                                    DataColumn(
                                        label: Label(
                                      label: "Ações",
                                      required: false,
                                    )),
                                  ],
                                  rows: provider.patients.content.map((p) {
                                    return DataRow(
                                      cells: [
                                        DataCell(ListTile(
                                          leading: CircleAvatar(
                                              backgroundColor: AppColors.primary,
                                              child: Center(
                                                child: Text(p.fullName[0].toUpperCase()),
                                              )),
                                          title: Text(
                                            p.fullName,
                                            style: GoogleFonts.inter(
                                              color: AppColors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          subtitle: Text(
                                            p.email!,
                                            style: GoogleFonts.inter(
                                              color: AppColors.gray2,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w200,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.zero,
                                        )),
                                        DataCell(Label(
                                          label: p.documentNumber!,
                                          required: false,
                                        )),
                                        DataCell(Label(
                                          label: p.healthNumber,
                                          required: false,
                                        )),
                                        DataCell(Label(
                                          label: p.phoneNumber,
                                          required: false,
                                        )),
                                        DataCell(Row(spacing: 16, children: [
                                          IconButton(
                                            onPressed: () => context.go(PatientDetailPage.route, extra: p.uuid!),
                                            icon: Icon(
                                              Icons.info,
                                              color: AppColors.primary,
                                              size: 32,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () => sideBarProvider.openOrCloseNewAppointmentModal(context: context),
                                            icon: Icon(
                                              Icons.edit_calendar,
                                              color: AppColors.primary,
                                              size: 32,
                                            ),
                                          )
                                        ])),
                                      ],
                                      selected: true,
                                    );
                                  }).toList()),
                            )).expanded(),
                        NumberPagination(
                          onPageChanged: (page) => provider.changePage(page),
                          totalPages: provider.patients.totalPages,
                          currentPage: provider.selectedPage,
                          fontFamily: GoogleFonts.interTextTheme().toString(),
                          controlButtonColor: AppColors.primary,
                        ).paddingOnly(bottom: 16)
                      ]).expanded()
                    : Center(
                        child: Text(
                          "Nenhum paciente encontrado",
                          style: GoogleFonts.inter(color: AppColors.gray2, fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
