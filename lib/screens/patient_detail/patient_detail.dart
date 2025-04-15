import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/main.router.dart';
import 'package:frontend/models/medical_history/medical_history_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/services/medical_history_service.dart';
import 'package:frontend/services/patient_service.dart';
import 'package:frontend/widgets/buttons/new_button.dart';
import 'package:frontend/widgets/buttons/new_consultation_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/buttons/refresh_button.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/text/info_shower.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'patient_detail.page.dart';
part 'patient_detail.provider.dart';
part 'patient_detail.mobile.dart';
part 'patient_detail.tablet.dart';
part 'patient_detail.desktop.dart';

@PagePath('/patients/detail/:uuid', redirect: [SignInRequiredRedirectQuery()])
class PatientDetailPage extends StatelessWidget {

  const PatientDetailPage({super.key, @PageParam("uuid") required this.uuid});

  final String uuid;

  @pageRouteQuery
  static const query = _$PatientDetailPageQuery();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _PatientDetailMobile(patientUuid: uuid),
      tablet: (context) => _PatientDetailTablet(patientUuid: uuid),
      desktop: (context) => _PatientDetailDesktop(patientUuid: uuid,),
    );
  }
}