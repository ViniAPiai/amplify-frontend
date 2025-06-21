import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/screens/doctors/doctors.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/patient_detail/patient_detail.dart';
import 'package:frontend/screens/patients/patients.dart';
import 'package:frontend/screens/new_patient/new_patient.dart';
import 'package:frontend/screens/sign_in/sign_in.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import 'auth_notifier.dart';

class Routes {

  static GoRouter getRoutes(BuildContext context) {
    return GoRouter(
      initialLocation: SignInPage.route,
      redirect: (BuildContext context, GoRouterState state) {
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
          return AgendaPage.route;
        }

        return null;
      },
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
      ],

    );
  }

}
