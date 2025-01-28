import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'auth_notifier.dart';

class Routes {

  GoRouter getRoutes(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: Provider.of<AuthNotifier>(context, listen: true),
      redirect: (BuildContext context, GoRouterState state) async {
        final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
        if (authNotifier.isLoading) {
          return null;
        }
        final bool isAuthenticated = authNotifier.value;
        final bool isInSignInScreen = state.matchedLocation == '/';
        if (!isAuthenticated && !isInSignInScreen) {
          return '/';
        }
        if (isAuthenticated && isInSignInScreen) {
          return '/${HomeScreen.routeName}';
        }
        return null;
      },
      routes: [
        GoRoute(
          name: SignInScreen.routeName,
          path: '/',
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: '/${HomeScreen.routeName}',
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }

}
