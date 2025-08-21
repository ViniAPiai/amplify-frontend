import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/models/medical_history/medical_history_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/services/medical_history_service.dart';
import 'package:frontend/widgets/text/info_shower.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:frontend/l10n/app_localizations.dart';

part 'patient_detail.provider.dart';
part 'patient_detail.mobile.dart';
part 'patient_detail.tablet.dart';
part 'patient_detail.desktop.dart';

class PatientDetailPage extends StatelessWidget {

  static const String routeName = 'details';
  static const String route = '/$routeName';

  const PatientDetailPage({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _PatientDetailMobile(patientUuid: uuid),
      tablet: (context) => _PatientDetailTablet(patientUuid: uuid),
      desktop: (context) => _PatientDetailDesktop(patientUuid: uuid,),
    );
  }
}