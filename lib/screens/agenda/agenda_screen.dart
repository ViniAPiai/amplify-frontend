import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/widgets/amplify_calendar/amplify_calendar.dart';
import 'package:frontend/widgets/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
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