import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/models/auth/auth_request_model.dart';
import 'package:frontend/models/auth/auth_response_model.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';
import 'package:frontend/services/api_service.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toastification/toastification.dart';

part 'sign_in.page.dart';

part 'sign_in.provider.dart';

part 'sign_in.mobile.dart';

part 'sign_in.tablet.dart';

part 'sign_in.desktop.dart';

@PagePath("/sign_in", redirect: [SignInRequiredRedirectQuery()])
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @pageRouteQuery
  static const query = _$SignInPageQuery();

  @override
  createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  void signIn(SignInProvider provider) async {
    final currentContext = context;
    try {
      bool authenticated = await provider.signIn(currentContext);
      if (!mounted) return;
      if (authenticated) {
        Provider.of<AuthNotifier>(context, listen: false).login();
        context.router.push(HomePage.query());
      } else {
        Provider.of<AuthNotifier>(context, listen: false).logout();
        toastification.show(
          title: Text("Erro ao entrar"),
          description: Text("E-mail e/ou senha incorretos"),
          style: ToastificationStyle.minimal,
          type: ToastificationType.error,
        );
      }
    } catch (e) {
      Provider.of<AuthNotifier>(context, listen: false).logout();
      toastification.show(
        title: Text("Erro ao entrar"),
        description: Text("E-mail e/ou senha incorretos"),
        style: ToastificationStyle.minimal,
        type: ToastificationType.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignInMobile(
        signIn: (SignInProvider provider) => signIn(provider),
      ),
      tablet: (context) => _$SignInTablet(
        signIn: (SignInProvider provider) => signIn(provider),
      ),
      desktop: (context) => _$SignInDesktop(
        signIn: (SignInProvider provider) => signIn(provider),
      ),
    );
  }
}
