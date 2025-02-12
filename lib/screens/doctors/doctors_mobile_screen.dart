part of 'doctors_screen.dart';

class _DoctorsMobileScreen extends StatelessWidget {

  const _DoctorsMobileScreen();

  @override
  Widget build(BuildContext context) {
    DoctorsProvider provider = Provider.of<DoctorsProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    return SideBarScreen(
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
                    HeaderTitle(icon: Icons.person_3, title: t.doctorsList),
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
                                  text: " ${t.doctorsLabel}",
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
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
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
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8,),
              NumberPagination(
                onPageChanged: (page) {},
                totalPages: 10,
                currentPage: 1,
                visiblePagesCount: 3,
                fontFamily: GoogleFonts.interTextTheme().toString(),
                controlButtonColor: AppColors.secondary,
              )
            ],
          )
      ),
    );
  }
}