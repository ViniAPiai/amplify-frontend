import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:frontend/widgets/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'patients_provider.dart';

part 'patients_mobile_screen.dart';

part 'patients_tablet_screen.dart';

part 'patients_desktop_screen.dart';

class PatientsScreen extends StatefulWidget {

  static const String routeName = 'patients';

  const PatientsScreen({super.key});

  @override
  createState() => _PatientsScreen();
}

class _PatientsScreen extends State<PatientsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$PatientsMobileScreen(),
      tablet: (context) => _$PatientsTabletScreen(),
      desktop: (context) => _$PatientsDesktopScreen(),
    );
  }
}