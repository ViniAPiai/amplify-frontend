import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/extension/message_extension.dart';
import 'package:frontend/main.router.dart';
import 'package:frontend/models/consultation/appointment_interval_enum.dart';
import 'package:frontend/models/consultation/appointment_model.dart';
import 'package:frontend/models/consultation/appointment_status_enum.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/screens/new_appointment/new_appointment.dart';
import 'package:frontend/services/appointment_service.dart';
import 'package:frontend/services/dentist_service.dart';
import 'package:frontend/services/nurse_service.dart';
import 'package:frontend/widgets/amplify_calendar/amplify_calendar.dart';
import 'package:frontend/widgets/dialogs/amplify_dialog.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'agenda.page.dart';
part 'agenda.provider.dart';
part 'agenda.mobile.dart';
part 'agenda.tablet.dart';
part 'agenda.desktop.dart';

@PagePath("/agenda", /*redirect: [SignInRequiredRedirectQuery()]*/)
class AgendaPage extends StatelessWidget {

  const AgendaPage({super.key});

  @pageRouteQuery
  static const query = _$AgendaPageQuery();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$AgendaMobile(),
      tablet: (context) => _$AgendaTabletScreen(),
      desktop: (context) => _$AgendaDesktopScreen(),
    );
  }
}