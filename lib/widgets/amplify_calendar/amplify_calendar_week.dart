part of 'amplify_calendar.dart';

class _$AmplifyCalendarWeek extends StatefulWidget {
  const _$AmplifyCalendarWeek();

  @override
  createState() => _AmplifyCalendarTabletScreen();
}

class _AmplifyCalendarTabletScreen extends State<_$AmplifyCalendarWeek> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AgendaProvider>(context, listen: false).loadEventsByDate(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    AgendaProvider provider = Provider.of<AgendaProvider>(context);
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return WeekView(
      key: provider.weekKey,
      controller: provider.controller,
      backgroundColor: AppColors.gray,
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
                      provider.setWeek(date);
                    }
                  },
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
              PopupMenuButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                color: Colors.white,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.list, color: Colors.grey.shade700, size: 24),
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text("dwadawdwad")),
                  PopupMenuItem(child: Text("dwadawdwad")),
                  PopupMenuItem(child: Text("dwadawdwad")),
                  PopupMenuItem(child: Text("dwadawdwad")),
                ],
              ),
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
            decoration:
                BoxDecoration(border: Border.all(color: Color(0xffe0e1e1)), color: date == DateTime.now() ? AppColors.secondary : AppColors.gray),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(text: "$day\n", style: GoogleFonts.inter(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500), children: [
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
      weekNumberBuilder: (firstDayOfWeek) => Container(
        color: AppColors.gray,
      ),
      onDateTap: (date) => provider.openAddConsultation(date: date),
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
      eventTileBuilder: (date, events, boundary, startDuration, endDuration) {
        return events.isNotEmpty
            ? Container(
                decoration: BoxDecoration(
                  color: events.first.color,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(4),
                child: Text(
                  events.first.title, // Exibir o título do evento
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              )
            : SizedBox.shrink();
      },
      onPageChange: (date, _) => provider.loadEventsByDate(date),
    );
  }
}
