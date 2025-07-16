import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/patient/patient_bloc.dart';
import 'package:frontend/bloc/patient/patient_event.dart';
import 'package:frontend/bloc/patient/patient_state.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/screens/patient_detail/patient_detail.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:frontend/l10n/app_localizations.dart';

part 'patients.mobile.dart';

part 'patients.tablet.dart';

part 'patients.desktop.dart';

class PatientsPage extends StatelessWidget {
  static const String routeName = 'patient';
  static const String route = '/$routeName';

  const PatientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$PatientsMobile(),
      tablet: (context) => _$PatientsTablet(),
      desktop: (context) => _$PatientsDesktop(),
    );
  }
}
