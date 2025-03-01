part of 'amplify_calendar.dart';

class _$AmplifyCalendarDay extends StatefulWidget {
  const _$AmplifyCalendarDay();

  @override
  createState() => _AmplifyCalendarMobileScreen();
}

class _AmplifyCalendarMobileScreen extends State<_$AmplifyCalendarDay> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AgendaProvider>(context, listen: false).loadEventsByDate(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AgendaProvider agendaProvider = Provider.of<AgendaProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return Consumer<AgendaProvider>(builder: (context, provider, child) {
      return DayView(
        key: provider.dayKey,
        controller: provider.controller,
        backgroundColor: AppColors.gray,
        dayTitleBuilder: (date) {
          String finalDate = DateFormat.yMMMMd(locale.getLocaleString()).format(date);
          return Container(
            width: context.width,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            color: AppColors.gray,
            child: Row(
              spacing: 16,
              children: [
                OutlinedButton(
                    onPressed: () => provider.previousDay(),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        fixedSize: Size(25, 25)),
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.grey.shade700,
                      size: 24,
                    )),
                OutlinedButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now().add(Duration(days: 365 * 4)),
                        locale: locale.locale,
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(
                              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondary),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        provider.setDay(date);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        fixedSize: Size(220, 25)),
                    child: Text(
                      finalDate,
                      style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                    )),
                OutlinedButton(
                    onPressed: () => provider.nextDay(),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        fixedSize: Size(25, 25)),
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey.shade700,
                      size: 24,
                    )),
                Expanded(child: const SizedBox()),
                context.isTabletOrDesktop
                    ? Row(spacing: 16, children: [
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                                fixedSize: Size(25, 25)),
                            child: Icon(
                              Icons.refresh,
                              color: Colors.grey.shade700,
                              size: 24,
                            )),
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.zero,
                                fixedSize: Size(25, 25)),
                            child: Icon(
                              Icons.print,
                              color: Colors.grey.shade700,
                              size: 24,
                            )),
                        OutlinedButton.icon(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            fixedSize: Size(120, 25),
                          ),
                          icon: Icon(
                            Icons.filter_alt,
                            color: Colors.grey.shade700,
                            size: 24,
                          ),
                          label: Text(
                            t.filter,
                            style: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        )
                      ])
                    : const SizedBox()
              ],
            ),
          );
        },
        timeLineBuilder: (date) {
          return Container(
            padding: EdgeInsets.all(8),
            height: 70,
            margin: EdgeInsets.zero,
            child: Text(
              DateFormat.Hm(locale.getLocaleString()).format(date),
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(color: Colors.black, fontSize: context.isTabletOrDesktop ? 14 : 12, fontWeight: FontWeight.w400),
            ),
          );
        },
        onDateTap: (date) => agendaProvider.openAddConsultation(date: date),
        onEventTap: (events, date) {
          switch (ConsultationStatusEnum.fromColor(events.first.color)) {
            case ConsultationStatusEnum.waitingForClinicConfirmation:
              provider.confirmConsultation(context, events.first);
              break;
            case ConsultationStatusEnum.cancelled:
              break;
            case ConsultationStatusEnum.scheduled:
            case ConsultationStatusEnum.patientInTheClinic:
            case ConsultationStatusEnum.finished:
              provider.openAddConsultation(date: date, event: events.first);
          }
        },
        onPageChange: (date, _) => provider.loadEventsByDate(date),
      );
    });
  }
}
