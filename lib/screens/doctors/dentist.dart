import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:frontend/l10n/app_localizations.dart';

part 'dentist.mobile.dart';
part 'dentist.tablet.dart';
part 'dentist.desktop.dart';

class DoctorsPage extends StatelessWidget {

  static const String routeName = 'dentist';
  static const String route = '/$routeName';

  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _DoctorsMobile(),
      tablet: (context) => _DoctorsTablet(),
      desktop: (context) => _DoctorsDesktop(),
    );
  }
}