part of 'patients_screen.dart';

class _$PatientsDesktopScreen extends StatefulWidget {
  const _$PatientsDesktopScreen();

  @override
  createState() => _PatientsDesktopScreen();
}

class _PatientsDesktopScreen extends State<_$PatientsDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    PatientsProvider provider = Provider.of<PatientsProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBarScreen(
      child: Container(
        width: context.mqWidth,
        height: context.mqHeight,
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            Row(
              spacing: 16,
              children: [
                Expanded(
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
                          FontAwesomeIcons.search,
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
              ],
            ),
            SizedBox(
              width: context.mqWidth,
              child: DataTable(
                  columns: [
                    DataColumn(label: Label(label: t.fullName, required: false,)),
                    DataColumn(label: Label(label: t.email, required: false,)),
                    DataColumn(label: Label(label: t.documentNumber, required: false,)),
                    DataColumn(label: Label(label: t.healthNumber, required: false,)),
                    DataColumn(label: Label(label: t.phoneNumber, required: false,)),
                    DataColumn(label: Label(label: "Ações", required: false,)),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Label(label: "Igor", required: false,)),
                      DataCell(Label(label: "igor@gmail.com", required: false,)),
                      DataCell(Label(label: "098.912.312-04", required: false,)),
                      DataCell(Label(label: "123489381239123", required: false,)),
                      DataCell(Label(label: "(48) 99231-1323", required: false,)),
                      DataCell(FaIcon(FontAwesomeIcons.pen, color: context.primaryColor, size: 16,)),
                    ]),

                  ]
              ),
            )
          ],
        ),
      ),
    );
  }
}
