import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/lading/landing_screen.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {

  GoRouter get routes => GoRouter(
      initialLocation: '/',
      /*redirect: (BuildContext context, GoRouterState state) async {
        final isAuthenticated = false;
        final isInSignInScreen = state.path == '/';
        if (!isAuthenticated && !isInSignInScreen) {
          return '/';
        } else {
          return null;
        }
      },*/
      routes: [
        GoRoute(
          name: SignInScreen.routeName,
          path: '/',
          builder: (context, state) => SignInScreen(),
        ),
      ]

  );

}
