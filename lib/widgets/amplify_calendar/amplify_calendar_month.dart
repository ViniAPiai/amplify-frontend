part of 'amplify_calendar.dart';

class _$AmplifyCalendarMonth extends StatefulWidget {
  const _$AmplifyCalendarMonth();

  @override
  createState() => _AmplifyCalendarDesktopScreen();
}

class _AmplifyCalendarDesktopScreen extends State<_$AmplifyCalendarMonth> {
  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return Consumer<AgendaProvider>(
      builder: (context, provider, child) {
      return MonthView(
        key: provider.monthKey,
        controller: provider.controller,
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
                child: Text(
                  DateFormat.d(locale.getLocaleString()).format(date),
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          );
        },
      );
    },);
  }
}