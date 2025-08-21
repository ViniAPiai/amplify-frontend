part of 'amplify_calendar.dart';

class _$AmplifyCalendarDay extends StatefulWidget {
  const _$AmplifyCalendarDay();

  @override
  createState() => _AmplifyCalendarMobileScreen();
}

class _AmplifyCalendarMobileScreen extends State<_$AmplifyCalendarDay> {

  GlobalKey<DayViewState> dayKey = GlobalKey<DayViewState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AgendaBloc>().add(LoadEventsByDate(DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    LocaleBloc locale = context.read<LocaleBloc>();
    AppLocalizations t = AppLocalizations.of(context)!;
    return BlocListener<AgendaBloc, AgendaState>(
        listener: (context, state) {
          if(state.type == AgendaActionType.day) {
            switch(state.action) {
              case AgendaAction.set:
                dayKey.currentState!.animateToDate(state.date!);
                break;
              case AgendaAction.next:
                dayKey.currentState!.nextPage();
                break;
              case AgendaAction.previous:
                dayKey.currentState!.previousPage();
                break;
            }
          }
        },
      child: BlocBuilder<AgendaBloc, AgendaState>(
        builder: (context, state) {
          return DayView(
            key: dayKey,
            controller: state.controller,
            backgroundColor: AppColors.gray,
            dayTitleBuilder: (date) {
              String finalDate = context.isTabletOrDesktop
                  ? DateFormat.yMMMMd(context.getLocaleString(locale.state.locale)).format(date)
                  : DateFormat.yMd(context.getLocaleString(locale.state.locale)).format(date);
              return Container(
                width: context.width,
                padding: EdgeInsets.fromLTRB(context.isTabletOrDesktop ? 16 : 8, 0, context.isTabletOrDesktop ? 16 : 8, 8),
                color: AppColors.gray,
                child: Row(
                  spacing: context.isTabletOrDesktop ? 16 : 8,
                  children: [
                    OutlinedButton(
                        onPressed: () => context.read<AgendaBloc>().add(const NavigationChanged(AgendaActionType.day, AgendaAction.previous)),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            fixedSize: Size(context.isTabletOrDesktop ? 25 : 15, context.isTabletOrDesktop ? 25 : 15)),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.grey.shade700,
                          size: context.isTabletOrDesktop ? 24 : 16,
                        )),
                    OutlinedButton(
                        onPressed: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now().subtract(Duration(days: 365)),
                            lastDate: DateTime.now().add(Duration(days: 365 * 4)),
                            locale: locale.state.locale,
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData(
                                  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (date != null) {
                            context.read<AgendaBloc>().add(NavigationChanged(AgendaActionType.day, AgendaAction.set, date: date));
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            fixedSize: Size(context.isTabletOrDesktop ? 220 : context.width - 180, 25)),
                        child: Text(
                          finalDate,
                          style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                        )),
                    OutlinedButton(
                        onPressed: () => context.read<AgendaBloc>().add(const NavigationChanged(AgendaActionType.day, AgendaAction.next)),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            fixedSize: Size(context.isTabletOrDesktop ? 25 : 15, context.isTabletOrDesktop ? 25 : 15)),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey.shade700,
                          size: context.isTabletOrDesktop ? 24 : 16,
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
                  DateFormat.Hm(context.getLocaleString(locale.state.locale)).format(date),
                  textAlign: TextAlign.right,
                  style: GoogleFonts.inter(color: Colors.black, fontSize: context.isTabletOrDesktop ? 14 : 12, fontWeight: FontWeight.w400),
                ),
              );
            },
            onDateTap: (date) => context.read<SideBarBloc>().add(ToggleNewAppointmentModal(date: date)),
            onEventTap: (events, date) {
              switch (AppointmentStatusEnum.fromColor(events.first.color)) {
                case AppointmentStatusEnum.waitingForClinicConfirmation:
                // provider.confirmConsultation(context, events.first);
                  break;
                case AppointmentStatusEnum.cancelled:
                  break;
                case AppointmentStatusEnum.scheduled:
                  context.read<SideBarBloc>().add(ToggleAppointmentDetailsModal(uuid: (events.first.event as AppointmentModel).uuid!));
                case AppointmentStatusEnum.arrived:
                case AppointmentStatusEnum.finished:
                  context.read<SideBarBloc>().add(ToggleNewAppointmentModal(date: date));
                  break;
                case AppointmentStatusEnum.inProgress:
                  context.read<SideBarBloc>().add(ToggleAppointmentDetailsModal(uuid: (events.first.event as AppointmentModel).uuid!));
              }
            },
            onPageChange: (date, _) => context.read<AgendaBloc>().add(LoadEventsByDate(date)),
          );
        }
      ),
    );
  }
}
