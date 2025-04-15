import 'package:flutter/material.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/main.router.dart';
import 'package:katana_router/katana_router.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class SignInRequiredRedirectQuery extends RedirectQuery {
  const SignInRequiredRedirectQuery();

  @override
  FutureOr<RouteQuery> redirect(BuildContext context, RouteQuery source) async {
    if (context.read<AuthNotifier>().isLoggedIn) {
      return source;
    } else {
      return SignInPage.query();
    }
  }
}
