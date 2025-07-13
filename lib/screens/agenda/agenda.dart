import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_event.dart';
import 'package:frontend/bloc/agenda/agenda_state.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/widgets/amplify_calendar/amplify_calendar.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:frontend/l10n/app_localizations.dart';

part 'agenda.mobile.dart';
part 'agenda.tablet.dart';
part 'agenda.desktop.dart';

class AgendaPage extends StatelessWidget {

  static const String routeName = 'agenda';
  static const String route = '/$routeName';

  const AgendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$AgendaMobile(),
      tablet: (context) => _$AgendaTabletScreen(),
      desktop: (context) => _$AgendaDesktopScreen(),
    );
  }
}