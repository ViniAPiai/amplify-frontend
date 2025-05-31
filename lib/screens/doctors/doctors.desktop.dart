part of 'doctors.dart';

class _DoctorsDesktop extends StatelessWidget {

  const _DoctorsDesktop();

  @override
  Widget build(BuildContext context) {
    DoctorsProvider provider = Provider.of<DoctorsProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
      child: Container(
        width: context.width,
        height: context.height,
        color: AppColors.gray,
        child: Column(
          spacing: 16,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                spacing: 16,
                children: [
                  HeaderTitle(icon: Icons.person_3, title: t.doctorsList),
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: context.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: EdgeInsets.all(16),
                          fixedSize: Size(135, 50)),
                      child: Row(
                        spacing: 8,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.search,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            color: Colors.white,
                            size: 16,
                          )
                        ],
                      )),
                  OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: context.primaryColor)),
                          padding: EdgeInsets.all(16),
                          fixedSize: Size(100, 50)),
                      child: Row(
                        spacing: 8,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.newPatient,
                            style: GoogleFonts.inter(
                              color: context.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          FaIcon(
                            FontAwesomeIcons.plus,
                            color: context.primaryColor,
                            size: 16,
                          )
                        ],
                      )),
                  LocaleChanger()
                ],
              ),
            ),
            Divider(thickness: .5, color: AppColors.gray2),
            Container(
              width: context.width,
              height: 35,
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: Row(
                spacing: 16,
                children: [
                  RichText(
                      text: TextSpan(
                          text: "76",
                          style: GoogleFonts.inter(
                            color: context.primaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                                text: " ${t.doctorsLabel}",
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
            Divider(thickness: .5, color: AppColors.gray2),
            Container(
                width: context.mqWidth,
                height: context.height - 300,
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
                              label: t.phoneNumber,
                              required: false,
                            )),
                        DataColumn(
                            label: Label(
                              label: "Ações",
                              required: false,
                            )),
                      ],
                      rows: List.generate(10, (index) {
                        return DataRow(
                            cells: [
                              DataCell(ListTile(
                                leading: CircleAvatar(
                                    backgroundColor: AppColors.secondary,
                                    child: Center(
                                      child: Text("IG"),
                                    )),
                                title: Text(
                                  "igor@gmail.com",
                                  style: GoogleFonts.inter(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  "igor@gmail.com",
                                  style: GoogleFonts.inter(
                                    color: AppColors.gray2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                              )),
                              DataCell(Label(
                                label: "098.912.312-04",
                                required: false,
                              )),
                              DataCell(Label(
                                label: "123489381239123",
                                required: false,
                              )),
                              DataCell(Label(
                                label: "(48) 99231-1323",
                                required: false,
                              )),
                              DataCell(FaIcon(
                                FontAwesomeIcons.pen,
                                color: context.primaryColor,
                                size: 16,
                              )),
                            ],
                            /*mouseCursor: WidgetStateProperty.resolveWith<MouseCursor>((states) {
                        return states.contains(WidgetState.hovered) ? SystemMouseCursors.click : SystemMouseCursors.basic;
                      },),*/
                            selected: true,
                            color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                              return states.contains(WidgetState.hovered) ? Colors.blue : Colors.white;
                            }));
                      })),
                )),
            NumberPagination(
              onPageChanged: (page) {},
              totalPages: 10,
              currentPage: 1,
              fontFamily: GoogleFonts.interTextTheme().toString(),
              controlButtonColor: AppColors.secondary,
            )
          ],
        ),
      ),
    );
  }
}