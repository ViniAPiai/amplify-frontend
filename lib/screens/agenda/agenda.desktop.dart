part of 'agenda.dart';

class _$AgendaDesktopScreen extends StatefulWidget {
  const _$AgendaDesktopScreen();

  @override
  createState() => _AgendaDesktopScreen();
}

class _AgendaDesktopScreen extends State<_$AgendaDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(child: Consumer<AgendaProvider>(builder: (context, provider, child) {
      return Stack(
        children: [
          SizedBox(
            width: context.mqWidth,
            height: context.mqHeight,
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.gray2))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 16,
                    children: [
                      HeaderTitle(icon: Icons.calendar_month, title: t.agenda),
                      ToggleSwitch(
                        minWidth: 100,
                        minHeight: 50,
                        initialLabelIndex: provider.selectedIndex,
                        totalSwitches: 3,
                        inactiveBgColor: AppColors.gray,
                        inactiveFgColor: Colors.grey.shade400,
                        activeBgColor: [AppColors.gray],
                        activeFgColor: context.primaryColor,
                        labels: [t.daily, t.weakly, t.monthly],
                        customTextStyles: [GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500)],
                        onToggle: (index) => provider.toggle(index!),
                        cornerRadius: 12,
                      ),
                      Expanded(child: SizedBox()),
                      OutlinedButton.icon(
                          onPressed: () => sideBarProvider.openOrCloseNewAppointmentModal(context: context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: context.primaryColor, width: 2),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: Icon(
                            Icons.add,
                            color: context.primaryColor,
                          ),
                          label: Text(
                            t.newLabel,
                            style: GoogleFonts.inter(color: context.primaryColor, fontSize: 16, fontWeight: FontWeight.w500),
                          )),
                      LocaleChanger()
                    ],
                  ),
                ),
                SizedBox(width: context.mqWidth, height: context.mqHeight - 150, child: AmplifyCalendar()),
              ],
            ),
          ),
          if (provider.isLoadingConsultation)
            Container(
              width: context.mqWidth,
              height: context.mqHeight,
              color: Colors.black,
              child: SizedBox(
                  width: 250,
                  height: 250,
                  child: CircularProgressIndicator(
                    color: AppColors.secondary,
                  )).toCenter(),
            ).setOpacity(opacity: 0.5),
        ],
      );
    }));
  }
}
