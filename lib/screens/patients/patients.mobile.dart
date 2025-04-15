part of 'patients.dart';

class _$PatientsMobile extends StatelessWidget {
  const _$PatientsMobile();

  @override
  Widget build(BuildContext context) {
    PatientsProvider provider = Provider.of<PatientsProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
      appBar: PreferredSize(
          preferredSize: Size(context.width, 175),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: AppColors.gray,
                    border: Border(
                        bottom: BorderSide(color: AppColors.gray2)
                    )
                ),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  spacing: 16,
                  children: [
                    HeaderTitle(icon: Icons.person_3, title: AppLocalizations.of(context)!.patientList),
                    Expanded(child: SizedBox()),
                    OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: context.primaryColor)),
                            padding: EdgeInsets.all(8),
                            fixedSize: Size(50, 50)),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: context.primaryColor,
                            size: 20,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                width: context.width,
                height: 75,
                decoration: BoxDecoration(
                    color: AppColors.gray,
                    border: Border(
                        bottom: BorderSide(color: AppColors.gray2)
                    )
                ),
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Row(
                  spacing: 16,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "76",
                            style: GoogleFonts.inter(
                              color: context.primaryColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                  text: " ${t.patientsLabel}",
                                  style: GoogleFonts.inter(
                                    color: AppColors.gray2,
                                    fontSize: 18,
                                  ))
                            ])),
                    Expanded(child: SizedBox()),
                    PrinterButton(),
                    FilterButton()
                  ],
                ),
              ),
            ],
          )
      ),
      child: Container(
        width: context.width,
        height: context.height,
        color: AppColors.gray,
        padding: const EdgeInsets.all(8),
        child: Column(
          spacing: 8,
          children: [
            provider.hasContent() ? ListView.builder(
                itemCount: provider.patients.content.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  PatientModel p = provider.patients.content[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Material(
                      color: Colors.white,
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(8),
                        minVerticalPadding: 2,
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
                      ),
                    ),
                  );
                },
            ).expanded() : const SizedBox(),
            provider.hasContent() ? NumberPagination(
              onPageChanged: (page) => provider.changePage(page),
              totalPages: provider.patients.totalPages,
              currentPage: provider.selectedPage,
              visiblePagesCount: 3,
              fontFamily: GoogleFonts.interTextTheme().toString(),
              controlButtonColor: AppColors.secondary,
            ) : const SizedBox()
          ],
        )
      ),
    );
  }
}