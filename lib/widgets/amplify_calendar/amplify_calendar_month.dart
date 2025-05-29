part of 'amplify_calendar.dart';

class _$AmplifyCalendarMonth extends StatefulWidget {
  const _$AmplifyCalendarMonth();

  @override
  createState() => _AmplifyCalendarDesktopScreen();
}

class _AmplifyCalendarDesktopScreen extends State<_$AmplifyCalendarMonth> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        Provider.of<AgendaProvider>(context, listen: false).loadEventsByDate(DateTime.now());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AgendaProvider provider = Provider.of<AgendaProvider>(context);
    SideBarProvider sideBarProvider = Provider.of<SideBarProvider>(context);
    return MonthView(
      key: provider.monthKey,
      controller: provider.controller,
      startDay: WeekDays.sunday,
      cellAspectRatio: 1.2,
      hideDaysNotInMonth: true,
      headerBuilder: (date) {
        String data = DateFormat.yMMMM(locale.getLocaleString()).format(date);
        data = data.substring(0, 1).toUpperCase() + data.substring(1);
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          color: AppColors.gray,
          child: Row(
            spacing: 16,
            children: [
              OutlinedButton(
                  onPressed: () => provider.previousMonth(),
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
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.zero,
                      fixedSize: Size(200, 25)),
                  child: Text(
                    data,
                    style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                  )),
              OutlinedButton(
                  onPressed: () => provider.nextMonth(),
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
              RefreshButton(),
              PrinterButton(),
              FilterButton(),
            ],
          ),
        );
      },
      weekDayBuilder: (weekDay) {
        DateTime date = DateTime(2024, 1, 7 + weekDay);
        String day = DateFormat.EEEE(locale.getLocaleString()).format(date);
        day = day.substring(0, 1).toUpperCase() + day.substring(1);
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(border: Border.all(color: Color(0xffe0e1e1))),
          child: Text(
            day,
            style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        );
      },
      cellBuilder: (date, event, isToday, isInMonth, hideDaysNotInMonth) {
        if (!isInMonth) {
          return Container();
        }
        return Column(
          children: [
            Container(
                color: isToday ? AppColors.secondary : Colors.transparent,
                width: 1000,
                child: Column(
                  children: [
                    Text(
                      DateFormat.d(locale.getLocaleString()).format(date),
                      style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    event.length > 4
                        ? SizedBox()
                        : Column(
                            children: event.map(
                              (e) {
                                return Text(e.title);
                              },
                            ).toList(),
                          )
                  ],
                )),
          ],
        );
      },
      onCellTap: (events, date) => sideBarProvider.openOrCloseNewAppointmentModal(context: context, date: date),
      onPageChange: (date, _) => provider.loadEventsByDate(date),
    );
  }

  String _dateTimeToMonthYearString(DateTime date, LocaleProvider locale) {
    String data = DateFormat.yMMMM(locale.getLocaleString()).format(date);
    return data.substring(0, 1).toUpperCase() + data.substring(1);
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}
