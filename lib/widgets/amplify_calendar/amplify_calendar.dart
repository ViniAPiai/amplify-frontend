import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/extension/message_extension.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/models/consultation/consultation_model.dart';
import 'package:frontend/models/consultation/consultation_status_enum.dart';
import 'package:frontend/screens/agenda/agenda_screen.dart';
import 'package:frontend/services/consultation_service.dart';
import 'package:frontend/widgets/amplify_calendar/meeting.dart';
import 'package:frontend/widgets/amplify_calendar/meeting_data_source.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/buttons/refresh_button.dart';
import 'package:frontend/widgets/clipper/calendar_clipper.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
    return Consumer<AgendaProvider>(
        builder: (context, provider, child) {
          /*switch (widget.selectedIndex ?? provider.selectedIndex) {
            case 0:
              return _$AmplifyCalendarDay();
            case 1:
              return _$AmplifyCalendarWeek();
            case 2:
              return _$AmplifyCalendarMonth();
            default:
              return _$AmplifyCalendarMonth();
          }*/
          return _$AmplifyCalendarMonth();
        },
    );
  }



}