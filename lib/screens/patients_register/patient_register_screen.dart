import 'dart:convert';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/widgets/buttons/register_button.dart';
import 'package:frontend/widgets/form/birthday_date_form_field.dart';
import 'package:frontend/widgets/form/city_form_field.dart';
import 'package:frontend/widgets/form/complement_form_field.dart';
import 'package:frontend/widgets/form/confirm_password_form_field.dart';
import 'package:frontend/widgets/form/country_form_field.dart';
import 'package:frontend/widgets/form/document_number_form_field.dart';
import 'package:frontend/widgets/form/email_form_field.dart';
import 'package:frontend/widgets/form/full_name_form_field.dart';
import 'package:frontend/widgets/form/gender_form_field.dart';
import 'package:frontend/widgets/form/number_form_field.dart';
import 'package:frontend/widgets/form/occupation_form_field.dart';
import 'package:frontend/widgets/form/password_form_field.dart';
import 'package:frontend/widgets/form/phone_number_form_field.dart';
import 'package:frontend/widgets/form/postal_code_form_field.dart';
import 'package:frontend/widgets/form/state_form_field.dart';
import 'package:frontend/widgets/form/street_form_field.dart';
import 'package:frontend/widgets/text/header_title.dart';
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'patient_register_provider.dart';

part 'patient_register_mobile_screen.dart';

part 'patient_register_tablet_screen.dart';

part 'patient_register_desktop_screen.dart';

class PatientRegisterScreen extends StatefulWidget {

  static const String routeName = 'patient_register';

  const PatientRegisterScreen({super.key});

  @override
  createState() => _PatientRegisterScreen();
}

class _PatientRegisterScreen extends State<PatientRegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _PatientRegisterMobileScreen(),
      tablet: (context) => _PatientRegisterTabletScreen(),
      desktop: (context) => _PatientRegisterDesktopScreen(),
    );
  }

}