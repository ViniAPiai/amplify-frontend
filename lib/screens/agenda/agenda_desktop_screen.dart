part of 'agenda_screen.dart';

class _$AgendaDesktopScreen extends StatefulWidget {
  const _$AgendaDesktopScreen();

  @override
  createState() => _AgendaDesktopScreen();
}

class _AgendaDesktopScreen extends State<_$AgendaDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBarScreen(child: Consumer<AgendaProvider>(builder: (context, provider, child) {
      return Container(
        width: context.mqWidth,
        height: context.mqHeight,
        color: AppColors.gray,
        child: Column(
          spacing: 16,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
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
                        t.newPatient,
                        style: GoogleFonts.inter(color: context.primaryColor, fontSize: 16, fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade300,
            ),
            SizedBox(width: context.mqWidth, height: context.mqHeight - 150, child: _getCalendar(provider, locale, t)),
          ],
        ),
      );
    }));
  }

  Widget _getCalendar(AgendaProvider provider, LocaleProvider locale, AppLocalizations t) {
    switch (provider.selectedIndex) {
      case 0:
        return SizedBox();
      case 1:
        return _getWeekView(provider, locale, t);
      case 2:
        return _getMonthView(provider, locale, t);
      default:
        return _getMonthView(provider, locale, t);
    }
  }

  WeekView _getWeekView(AgendaProvider provider, LocaleProvider locale, AppLocalizations t) {
    return WeekView(
      key: provider.weekKey,
      controller: EventController(),
      headerStyle: HeaderStyle(decoration: BoxDecoration(color: context.primaryColor)),
      weekPageHeaderBuilder: (startDate, endDate) {
        String data = DateFormat.yMMMMd(locale.getLocaleString()).format(startDate);
        String to = DateFormat.yMMMMd(locale.getLocaleString()).format(endDate);
        String finalDate = '${data.substring(0, 1).toUpperCase()}${data.substring(1)} ${t.to} ${to.substring(0, 1).toUpperCase()}${to.substring(1)}';
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Row(
            spacing: 16,
            children: [
              OutlinedButton(
                  onPressed: () => provider.previousWeek(),
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
                      fixedSize: Size(420, 25)),
                  child: Text(
                    finalDate,
                    style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                  )),
              OutlinedButton(
                  onPressed: () => provider.nextWeek(),
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
              ),
            ],
          ),
        );
      },
      weekDayBuilder: (date) {
        String day = DateFormat.EEEE(locale.getLocaleString()).format(date);
        day = day.substring(0, 1).toUpperCase() + day.substring(1);
        return Container(
            padding: EdgeInsets.all(8),
            height: 70,
            decoration: BoxDecoration(border: Border.all(color: Color(0xffe0e1e1)), color: date == DateTime.now() ? AppColors.secondary : AppColors.gray),
            child: RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
                    text: "$day\n",
                    style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    children: [
              TextSpan(
                  text: DateFormat.d(locale.getLocaleString()).format(date),
                  style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400)),
            ])));
      },
      timeLineBuilder: (date) {
        return Container(
          padding: EdgeInsets.all(8),
          height: 70,
          margin: EdgeInsets.zero,
          child: Text(
            DateFormat.Hm(locale.getLocaleString()).format(date),
            textAlign: TextAlign.right,
            style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        );
      },
      weekNumberBuilder: (firstDayOfWeek) => Container(color: AppColors.gray,),
      startDay: WeekDays.monday,
      backgroundColor: AppColors.gray,
    );
  }

  MonthView _getMonthView(AgendaProvider provider, LocaleProvider locale, AppLocalizations t) {
    CalendarEventData event = CalendarEventData(title: 'Test', date: DateTime.now());
    EventController controller = EventController();
    controller.add(event);
    return MonthView(
      key: provider.monthKey,
      controller: controller,
      cellAspectRatio: 1.2,
      hideDaysNotInMonth: true,
      headerBuilder: (date) {
        String data = DateFormat.yMMMM(locale.getLocaleString()).format(date);
        data = data.substring(0, 1).toUpperCase() + data.substring(1);
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
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
              ),
            ],
          ),
        );
      },
      headerStringBuilder: (date, {secondaryDate}) {
        String data = DateFormat.yMMMM(locale.getLocaleString()).format(date);
        return data.substring(0, 1).toUpperCase() + data.substring(1);
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
      weekDayStringBuilder: (weekDay) {
        DateTime date = DateTime(2024, 1, 7 + weekDay);
        String day = DateFormat.EEEE(locale.getLocaleString()).format(date);
        return day.substring(0, 1).toUpperCase() + day.substring(1);
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
  }
}
