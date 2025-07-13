import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/bloc/sign_in/sign_in_bloc.dart';
import 'package:frontend/bloc/sign_in/sign_in_event.dart';
import 'package:frontend/bloc/sign_in/sign_in_state.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

part 'sign_in.provider.dart';

part 'sign_in.mobile.dart';

part 'sign_in.tablet.dart';

part 'sign_in.desktop.dart';

class SignInPage extends StatefulWidget {

  static const String routeName = 'sign_in';
  static const String route = '/$routeName';

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignInMobile(),
      tablet: (context) => _$SignInTablet(),
      desktop: (context) => _$SignInDesktop(),
    );
  }
}
