import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/main.router.dart';
import 'package:frontend/models/page_patient_response_model.dart';
import 'package:frontend/models/page_request_model.dart';
import 'package:frontend/models/page_response_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/buttons/filter_button.dart';
import 'package:frontend/widgets/buttons/printer_button.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:number_pagination/number_pagination.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'patients.page.dart';
part 'patients.provider.dart';
part 'patients.mobile.dart';
part 'patients.tablet.dart';
part 'patients.desktop.dart';

@PagePath("/patients", redirect: [SignInRequiredRedirectQuery()])
class PatientsPage extends StatelessWidget {

  const PatientsPage({super.key});

  @pageRouteQuery
  static const query = _$PatientsPageQuery();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$PatientsMobile(),
      tablet: (context) => _$PatientsTablet(),
      desktop: (context) => _$PatientsDesktop(),
    );
  }
}