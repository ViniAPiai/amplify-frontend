import 'package:flutter/cupertino.dart';
import 'package:frontend/bloc/auth/auth_bloc.dart';
import 'package:frontend/bloc/auth/auth_state.dart';
import 'package:frontend/configs/auth_refresh.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/screens/crm/crm.dart';
import 'package:frontend/screens/doctors/dentist.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/patients/patients.dart';
import 'package:frontend/screens/sign_in/sign_in.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static GoRouter getRoutes(AuthBloc bloc) {
    return GoRouter(
      initialLocation: SignInPage.route,
      refreshListenable: AuthRefresh(bloc.stream),
      redirect: (BuildContext context, GoRouterState state) {
        final authState = bloc.state;
        final isLoggedIn = authState is Authenticated;
        final isLoading = authState is AuthLoading;
        final path = state.matchedLocation;

        const exactPublicPaths = [
          SignInPage.route,
          SignUpPage.route,
          '/recovery_password',
        ];

        final patternPublicPaths = [
          RegExp(r'^/reset-password/[^/]+$'),
        ];

        final isExactPublic = exactPublicPaths.contains(path);
        final matchesPattern = patternPublicPaths.any((regex) => regex.hasMatch(path));
        final isPublic = isExactPublic || matchesPattern;

        if (!isLoggedIn && !isPublic) {
          return SignInPage.route;
        }

        if (isLoggedIn && isPublic) {
          return Crm.route;
        }

        return null;
      },
      /*redirect: (BuildContext context, GoRouterState state) {
        final authNotifier = context.read<AuthNotifier>();
        final isLoggedIn = authNotifier.isLoggedIn;
        final path = state.matchedLocation;

        const exactPublicPaths = [
          SignInPage.route,
          SignUpPage.route,
          '/recovery_password',
        ];

        final patternPublicPaths = [
          RegExp(r'^/reset-password/[^/]+$'), // exemplo: /reset-password/token
        ];

        final isExactPublic = exactPublicPaths.contains(path);
        final matchesPattern = patternPublicPaths.any((regex) => regex.hasMatch(path));
        final isPublic = isExactPublic || matchesPattern;

        if (!isLoggedIn && !isPublic) {
          return SignInPage.route;
        }

        if (isLoggedIn && isPublic) {
          return HomePage.route;
        }

        return null;
      },*/
      routes: [
        GoRoute(
          name: SignInPage.routeName,
          path: SignInPage.route,
          builder: (context, state) => SignInPage(),
        ),
        GoRoute(
          name: HomePage.routeName,
          path: HomePage.route,
          builder: (context, state) => HomePage(),
        ),
        GoRoute(
          name: SignUpPage.routeName,
          path: SignUpPage.route,
          builder: (context, state) => SignUpPage(),
        ),
        GoRoute(
          name: PatientsPage.routeName,
          path: PatientsPage.route,
          builder: (context, state) => PatientsPage(),
          /*routes: [
            GoRoute(
              name: NewPatientPage.routeName,
              path: NewPatientPage.routeName,
              builder: (context, state) => NewPatientPage(),
            ),
            GoRoute(
              name: PatientDetailPage.routeName,
              path: '${PatientDetailPage.routeName}/:uuid',
              builder: (context, state) => PatientDetailPage(uuid: state.pathParameters['uuid']!),
            ),
          ]*/
        ),

        GoRoute(
          name: AgendaPage.routeName,
          path: AgendaPage.route,
          builder: (context, state) => AgendaPage(),
        ),
        GoRoute(
          name: DoctorsPage.routeName,
          path: DoctorsPage.route,
          builder: (context, state) => DoctorsPage(),
        ),
        GoRoute(
          name: Crm.routeName,
          path: Crm.route,
          builder: (context, state) => Crm(),
        )
      ],
    );
  }
}
