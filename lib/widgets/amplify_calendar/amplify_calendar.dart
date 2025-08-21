import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_event.dart';
import 'package:frontend/bloc/agenda/agenda_state.dart';
import 'package:frontend/bloc/locale/locale_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/locale_extension.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/enum/appointment_status_enum.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/widgets/amplify_calendar/meeting.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/buttons/refresh_button.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'amplify_calendar_day.dart';

part 'amplify_calendar_week.dart';

part 'amplify_calendar_month.dart';

class AmplifyCalendar extends StatefulWidget {

  static final String routeName = 'amplify_calendar';

  final int? selectedIndex;

  const AmplifyCalendar({super.key, this.selectedIndex});

  @override
  createState() => _AmplifyCalendarScreen();
}

class _AmplifyCalendarScreen extends State<AmplifyCalendar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgendaBloc, AgendaState>(
        builder: (context, state) {
          switch (widget.selectedIndex ?? state.selectedIndex) {
            case 0:
              return _$AmplifyCalendarDay();
            case 1:
              return _$AmplifyCalendarWeek();
            case 2:
              return _$AmplifyCalendarMonth();
            default:
              return _$AmplifyCalendarMonth();
          }
        },
    );
  }



}