import 'package:flutter/material.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/sign_in/sign_in.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';
import 'package:katana_router/katana_router.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SignInRequiredRedirectQuery extends RedirectQuery {
  const SignInRequiredRedirectQuery();

  @override
  FutureOr<RouteQuery> redirect(BuildContext context, RouteQuery source) async {
    if (Provider.of<AuthNotifier>(context, listen: false).isLoggedIn) {
      if(source is SignInPage || source is SignUpPage) {
        return HomePage.query();
      }
      return source;
    } else {
      return SignInPage.query();
    }
  }
}
