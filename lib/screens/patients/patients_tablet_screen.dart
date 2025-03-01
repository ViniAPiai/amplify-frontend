part of 'patients_screen.dart';

class _$PatientsTabletScreen extends StatefulWidget {
  const _$PatientsTabletScreen();

  @override
  createState() => _PatientsTabletScreen();
}

class _PatientsTabletScreen extends State<_$PatientsTabletScreen> {
  @override
  Widget build(BuildContext context) {
    PatientsProvider provider = Provider.of<PatientsProvider>(context);
    AgendaProvider agendaProvider = Provider.of<AgendaProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBarScreen(
        appBar: PreferredSize(
            preferredSize: Size(context.width, 175),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(color: AppColors.gray, border: Border(bottom: BorderSide(color: AppColors.gray2))),
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    spacing: 16,
                    children: [
                      HeaderTitle(icon: Icons.person_3, title: t.patientList),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        width: 300,
                        child: TextFormField(
                          controller: provider.tecSearch,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            hintText: AppLocalizations.of(context)!.searchPatientHint,
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => provider.search(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: context.primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(16),
                              fixedSize: Size(50, 50)),
                          child: Row(
                            spacing: 8,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 24,
                              )
                            ],
                          )),
                      OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: context.primaryColor)),
                              padding: EdgeInsets.all(16),
                              fixedSize: Size(50, 50)),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: context.primaryColor,
                              size: 24,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            )),
        child: SizedBox(
          width: context.width,
          height: context.height,
          child: provider.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                  ),
                ).expanded()
              : provider.hasContent()
                  ? Column(
                      children: [
                        Container(
                                width: context.width,
                                height: 75,
                                decoration: BoxDecoration(color: AppColors.gray, border: Border(bottom: BorderSide(color: AppColors.gray2))),
                                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
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
                                      thickness: 1,
                                      indent: 10,
                                      endIndent: 20,
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
                                height: context.height - 350,
                                padding: EdgeInsets.all(16),
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
                                          label: "Ações",
                                          required: false,
                                        )),
                                      ],
                                      rows: provider.patients.content.map((p) {
                                        return DataRow(
                                          cells: [
                                            DataCell(ListTile(
                                              leading: CircleAvatar(
                                                  backgroundColor: AppColors.secondary,
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
                                            DataCell(Row(spacing: 16, children: [
                                              Icon(
                                                Icons.info,
                                                color: AppColors.secondary,
                                                size: 32,
                                              ),
                                              IconButton(
                                                onPressed: () => agendaProvider.openAddConsultation(),
                                                icon: Icon(
                                                  Icons.edit_calendar,
                                                  color: AppColors.secondary,
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
                                controlButtonColor: AppColors.secondary,
                              ).paddingLTRB(16, 8, 16, 16)
                      ],
                    )
                  : Center(
                      child: Text(
                        "Nenhum paciente encontrado",
                        style: GoogleFonts.inter(color: AppColors.gray2, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
        ));
  }
}
