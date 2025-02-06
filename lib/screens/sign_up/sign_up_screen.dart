
import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dash_flags/dash_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/main.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
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
import 'package:frontend/widgets/locale_changer/locale_changer.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:convert';

import 'package:vector_graphics/vector_graphics.dart';


part 'sign_up_provider.dart';

part 'sign_up_mobile_screen.dart';

part 'sign_up_tablet_screen.dart';

part 'sign_up_desktop_screen.dart';

class SignUpScreen extends StatefulWidget {

  static final String routeName = 'sign_up';

  const SignUpScreen({super.key});

  @override
  createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignUpMobileScreen(),
      tablet: (context) => _$SignUpTabletScreen(),
      desktop: (context) => _$SignUpDesktopScreen(),
    );
  }
}