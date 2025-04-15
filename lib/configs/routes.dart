/*
import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/screens/new_appointment/new_appointment.dart';
import 'package:frontend/screens/doctors/doctors.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/patient_detail/patient_detail.dart';
import 'package:frontend/screens/patients/patients.dart';
import 'package:frontend/screens/new_patient/new_patient.dart';
import 'package:frontend/screens/sign_in/sign_in.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';

import 'package:provider/provider.dart';

import 'auth_notifier.dart';

class Routes {

  GoRouter getRoutes(BuildContext context) {
    return GoRouter(
      initialLocation: '/',
      redirect: (BuildContext context, GoRouterState state) {
        final authNotifier = context.read<AuthNotifier>();
        final isLoggedIn = authNotifier.isLoggedIn;
        final loc = state.uri.toString();

        final publicPaths = ['/', '/${SignUpScreen.routeName}', '/recovery_password'];
        if (!isLoggedIn && !publicPaths.contains(loc)) {
          return '/';
        }
        if (isLoggedIn && (loc == '/' || loc == '/${SignUpScreen.routeName}' || loc == '/recovery_password')) {
          return '/${HomeScreen.routeName}';
        }
        return null;
      },
      routes: [
        GoRoute(
          name: SignInScreen.routeName,
          path: '/',
          builder: (context, state) => SignInScreen(),
        ),
        GoRoute(
          name: HomeScreen.routeName,
          path: '/${HomeScreen.routeName}',
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          name: SignUpScreen.routeName,
          path: '/${SignUpScreen.routeName}',
          builder: (context, state) => SignUpScreen(),
        ),
        GoRoute(
          name: PatientsScreen.routeName,
          path: '/${PatientsScreen.routeName}',
          builder: (context, state) => PatientsScreen(),
          routes: [
            GoRoute(
              name: PatientRegisterScreen.routeName,
              path: 'new',
              builder: (context, state) => PatientRegisterScreen(),
            ),
            GoRoute(
              name: 'patient_detail',
              path: 'detail/:uuid',
              builder: (context, state) => PatientDetailScreen(patientUuid: state.pathParameters['uuid']!),
            ),
          ]
        ),
        GoRoute(
          name: AgendaScreen.routeName,
          path: '/${AgendaScreen.routeName}',
          builder: (context, state) => AgendaScreen(),
        ),
        GoRoute(
          name: DoctorsScreen.routeName,
          path: '/${DoctorsScreen.routeName}',
          builder: (context, state) => DoctorsScreen(),
        ),
        GoRoute(
          name: NewAppointmentScreen.routeName,
          path: '/${NewAppointmentScreen.routeName}',
          builder: (context, state) => NewAppointmentScreen(),
        )
      ],
    );
  }

}
*/
