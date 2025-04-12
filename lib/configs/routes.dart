import 'package:flutter/cupertino.dart';
import 'package:frontend/screens/agenda/agenda_screen.dart';
import 'package:frontend/screens/appointment/new_appointment_screen.dart';
import 'package:frontend/screens/doctors/doctors_screen.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/patient_detail/patient_detail_screen.dart';
import 'package:frontend/screens/patients/patients_screen.dart';
import 'package:frontend/screens/patients_register/patient_register_screen.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
import 'package:frontend/screens/sign_up/sign_up_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'auth_notifier.dart';

class Routes {

  GoRouter getRoutes(BuildContext context) {
    return GoRouter(
      navigatorKey: GlobalKey<NavigatorState>(),
      initialLocation: '/',
      // initialLocation: '/patients',
      refreshListenable: Provider.of<AuthNotifier>(context, listen: true),
      redirect: (BuildContext context, GoRouterState state) {
        final authNotifier = context.read<AuthNotifier>();
        if (authNotifier.isLoading) {
          return null;
        }
        final bool isAuthenticated = authNotifier.value;
        final bool isInSignInScreen = state.fullPath == '/';
        final bool isInSignUpScreen = state.fullPath == '/${SignUpScreen.routeName}';
        if (!isAuthenticated) {
          if(isInSignUpScreen) {
            return null;
          }
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
