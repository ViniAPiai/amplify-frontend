import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/models/user/user_model.dart';
import 'package:frontend/widgets/form/consultation_register/patient_selection_form_field.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'new_appointment.page.dart';
part 'new_appointment.provider.dart';
part 'new_appointment.mobile.dart';
part 'new_appointment.tablet.dart';
part 'new_appointment.desktop.dart';

@PagePath("/new_appointment", redirect: [SignInRequiredRedirectQuery()])
class NewAppointmentPage extends StatelessWidget {

  const NewAppointmentPage({super.key});

  @pageRouteQuery
  static const query = _$NewAppointmentPageQuery();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _NewAppointmentMobile(),
      tablet: (context) => _NewAppointmentTablet(),
      desktop: (context) => _NewAppointmentDesktop(),
    );
  }
}