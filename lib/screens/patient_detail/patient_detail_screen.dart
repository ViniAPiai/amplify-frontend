import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/models/medical_history_model/medical_history_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/services/medical_history_service.dart';
import 'package:frontend/services/patient_service.dart';
import 'package:frontend/widgets/buttons/new_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/buttons/refresh_button.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:frontend/widgets/text/info_shower.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toggle_switch/toggle_switch.dart';

part 'patient_detail_provider.dart';

part 'patient_detail_mobile_screen.dart';

part 'patient_detail_tablet_screen.dart';

part 'patient_detail_desktop_screen.dart';

class PatientDetailScreen extends StatefulWidget {

  static const String routeName = 'patient_detail';

  const PatientDetailScreen({super.key, required this.patientUuid});

  final String patientUuid;

  @override
  createState() => _PatientDetailScreen();
}

class _PatientDetailScreen extends State<PatientDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _PatientDetailMobileScreen(),
      tablet: (context) => _PatientDetailTabletScreen(),
      desktop: (context) => _PatientDetailDesktopScreen(patientUuid: widget.patientUuid,),
    );
  }

}