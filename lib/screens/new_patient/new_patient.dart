import 'dart:convert';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/extension/message_extension.dart';
import 'package:frontend/models/address/address_model.dart';
import 'package:frontend/models/patient/patient_model.dart';
import 'package:frontend/services/clinic_service.dart';
import 'package:frontend/services/patient_service.dart';
import 'package:frontend/widgets/buttons/register_button.dart';
import 'package:frontend/widgets/form/register_patient/birthday_date_form_field.dart';
import 'package:frontend/widgets/form/register_patient/city_form_field.dart';
import 'package:frontend/widgets/form/register_patient/complement_form_field.dart';
import 'package:frontend/widgets/form/register_patient/confirm_password_form_field.dart';
import 'package:frontend/widgets/form/register_patient/country_form_field.dart';
import 'package:frontend/widgets/form/register_patient/document_number_form_field.dart';
import 'package:frontend/widgets/form/register_patient/email_form_field.dart';
import 'package:frontend/widgets/form/register_patient/full_name_form_field.dart';
import 'package:frontend/widgets/form/register_patient/gender_form_field.dart';
import 'package:frontend/widgets/form/register_patient/number_form_field.dart';
import 'package:frontend/widgets/form/register_patient/occupation_form_field.dart';
import 'package:frontend/widgets/form/register_patient/password_form_field.dart';
import 'package:frontend/widgets/form/register_patient/phone_number_form_field.dart';
import 'package:frontend/widgets/form/register_patient/postal_code_form_field.dart';
import 'package:frontend/widgets/form/register_patient/state_form_field.dart';
import 'package:frontend/widgets/form/register_patient/street_form_field.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:katana_router/katana_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'new_patient.page.dart';
part 'new_patient.provider.dart';
part 'new_patient.mobile.dart';
part 'new_patient.tablet.dart';
part 'new_patient.desktop.dart';

@PagePath('/patients/new', redirect: [SignInRequiredRedirectQuery()])
class NewPatientPage extends StatelessWidget {

  const NewPatientPage({super.key});

  @pageRouteQuery
  static const query = _$NewPatientPageQuery();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _NewPatientMobile(),
      tablet: (context) => _NewPatientTablet(),
      desktop: (context) => _NewPatientDesktop(),
    );
  }
}