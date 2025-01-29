import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:katana_router/katana_router.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'sign_in_provider.dart';

part 'sign_in_mobile_screen.dart';

part 'sign_in_tablet_screen.dart';

part 'sign_in_desktop_screen.dart';

@PagePath("/")
class SignInScreen extends StatefulWidget {
  static final String routeName = 'sign_in';

  const SignInScreen({super.key});

  @pageRouteQuery
  static const query = _$SignInScreenQuery();

  @override
  createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  void signIn() async {
    final currentContext = context;
    SignInProvider provider =
        Provider.of<SignInProvider>(currentContext, listen: false);
    try {
      bool authenticated = await provider.signIn(currentContext);
      if (authenticated) {
        if (mounted) {
          print("AQUI");
          Provider.of<AuthNotifier>(context, listen: false).login();
          // currentContext.goNamed(HomeScreen.routeName);
        }
      } else {
        Provider.of<AuthNotifier>(context, listen: false).logout();
        PanaraInfoDialog.show(context,
            message: "E-mail e/ou senha incorretos",
            buttonText: "Ok",
            onTapDismiss: () {Navigator.pop(context);},
            panaraDialogType: PanaraDialogType.warning);
      }
    } catch (e) {
      Provider.of<AuthNotifier>(context, listen: false).logout();
      PanaraInfoDialog.show(
          context,
          message: "Um erro ocorreu no servidor",
          buttonText: "Ok",
          onTapDismiss: () {
            Navigator.pop(context);
          },
          barrierDismissible: false,
          panaraDialogType: PanaraDialogType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignInMobileScreen(
        signIn: signIn,
      ),
      tablet: (context) => _$SignInTabletScreen(
        signIn: signIn,
      ),
      desktop: (context) => _$SignInDesktopScreen(
        signIn: signIn,
      ),
    );
  }
}
