part of 'agenda.dart';

class _$AgendaMobile extends StatefulWidget {
  const _$AgendaMobile();

  @override
  createState() => _AgendaMobile();
}

class _AgendaMobile extends State<_$AgendaMobile> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AgendaBloc>().add(LoadEventsByDate(DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
        appBar: PreferredSize(
          preferredSize: Size(context.mqWidth, 100),
          child: SafeArea(
            child: Container(
              color: AppColors.gray,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: IconButton(
                          onPressed: () => context.read<SideBarBloc>().add(OpenSideBar()),
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
                        t.agenda,
                        style: GoogleFonts.inter(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Spacer(),
                    OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: context.primaryColor, width: 2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          fixedSize: const Size(115, 50),
                        ),
                        icon: Icon(
                          Icons.add,
                          color: context.primaryColor,
                        ),
                        label: Text(
                          t.newLabel,
                          style: GoogleFonts.inter(color: context.primaryColor, fontSize: 16, fontWeight: FontWeight.w500),
                        )),
                  ],
                ),
              ),
            ),
          )
        ),
        child: BlocBuilder<AgendaBloc, AgendaState>(
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                    padding: EdgeInsets.only(top: 16),
                    color: AppColors.gray,
                    height: context.height,
                    child: AmplifyCalendar(
                      selectedIndex: 0,
                    )),
                if (state.isLoadingAppointments)
                  Container(
                    width: context.mqWidth,
                    height: context.mqHeight,
                    color: Colors.black,
                    child: SizedBox(
                        width: 250,
                        height: 250,
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        )).toCenter(),
                  ).setOpacity(opacity: 0.5),
              ],
            );
          },
        )
    );
  }
}
