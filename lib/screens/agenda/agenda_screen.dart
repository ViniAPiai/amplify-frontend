import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/extension/message_extension.dart';
import 'package:frontend/models/consultation/consultation_interval_enum.dart';
import 'package:frontend/models/consultation/consultation_model.dart';
import 'package:frontend/models/consultation/consultation_status_enum.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/services/consultation_service.dart';
import 'package:frontend/services/doctor_service.dart';
import 'package:frontend/services/nurse_service.dart';
import 'package:frontend/widgets/amplify_calendar/amplify_calendar.dart';
import 'package:frontend/widgets/dialogs/amplify_dialog.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'agenda_provider.dart';

part 'agenda_mobile_screen.dart';

part 'agenda_tablet_screen.dart';

part 'agenda_desktop_screen.dart';

class AgendaScreen extends StatefulWidget {

  static final String routeName = 'agenda';

  const AgendaScreen({super.key});

  @override
  createState() => _AgendaScreen();
}

class _AgendaScreen extends State<AgendaScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$AgendaMobileScreen(),
      tablet: (context) => _$AgendaTabletScreen(),
      desktop: (context) => _$AgendaDesktopScreen(),
    );
  }
}