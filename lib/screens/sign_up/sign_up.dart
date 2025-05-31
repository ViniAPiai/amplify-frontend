
import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/main.router.dart';
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
import 'package:frontend/widgets/locale_changer/locale_changer.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:convert';

part 'sign_up.page.dart';
part 'sign_up.provider.dart';
part 'sign_up.mobile.dart';
part 'sign_up.tablet.dart';
part 'sign_up.desktop.dart';

@PagePath("/sign_up", redirect: [SignInRequiredRedirectQuery()])
class SignUpPage extends StatefulWidget {

  static const query = _$SignUpPageQuery();

  const SignUpPage({super.key});

  @override
  createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignUpMobile(),
      tablet: (context) => _$SignUpTablet(),
      desktop: (context) => _$SignUpDesktop(),
    );
  }
}