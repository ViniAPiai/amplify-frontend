import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/widgets/form/consultation_register/patient_selection_form_field.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'new_appointment_provider.dart';

part 'new_appointment_mobile_screen.dart';

part 'new_appointment_tablet_screen.dart';

part 'new_appointment_desktop_screen.dart';

class NewAppointmentScreen extends StatefulWidget {

  static const String routeName = 'appointment/new';

  const NewAppointmentScreen({super.key});

  @override
  createState() => _NewAppointmentScreen();
}

class _NewAppointmentScreen extends State<NewAppointmentScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _NewAppointmentMobileScreen(),
      tablet: (context) => _NewAppointmentTabletScreen(),
      desktop: (context) => _NewAppointmentDesktopScreen(),
    );
  }

}