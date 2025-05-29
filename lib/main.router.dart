// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_field, unused_element, require_trailing_commas, prefer_const_constructors, unnecessary_overrides, prefer_const_literals_to_create_immutables,  unnecessary_null_in_if_null_operators, library_prefixes, directives_ordering, depend_on_referenced_packages

// **************************************************************************
// RouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart';
import 'package:katana_router/katana_router.dart';
import 'package:frontend/screens/agenda/agenda.dart' as _$1;
import 'package:frontend/screens/doctors/doctors.dart' as _$2;
import 'package:frontend/screens/home/home.dart' as _$3;
import 'package:frontend/screens/new_patient/new_patient.dart' as _$4;
import 'package:frontend/screens/patient_detail/patient_detail.dart' as _$6;
import 'package:frontend/screens/patients/patients.dart' as _$5;
import 'package:frontend/screens/sign_in/sign_in.dart' as _$7;
export 'package:frontend/screens/agenda/agenda.dart' show AgendaPage;
export 'package:frontend/screens/doctors/doctors.dart' show DoctorsPage;
export 'package:frontend/screens/home/home.dart' show HomePage;
export 'package:frontend/screens/new_patient/new_patient.dart'
    show NewPatientPage;
export 'package:frontend/screens/patient_detail/patient_detail.dart'
    show PatientDetailPage;
export 'package:frontend/screens/patients/patients.dart' show PatientsPage;
export 'package:frontend/screens/sign_in/sign_in.dart' show SignInPage;

class AutoRouter extends AppRouter {
  AutoRouter({
    super.unknown,
    super.boot,
    super.initialPath,
    super.initialQuery,
    super.redirect = const [],
    super.observers = const [],
    super.redirectLimit = 5,
    super.navigatorKey,
    super.restorationScopeId,
    super.defaultTransitionQuery,
    List<RouteQueryBuilder>? pages,
    super.reportsRouteUpdateToEngine = true,
    super.backgroundWidget = const Scaffold(),
    super.loggerAdapters,
  }) : super(
          pages: pages ??
              [
                _$7.SignInPage.query,
                _$4.NewPatientPage.query,
                _$6.PatientDetailPage.query,
                _$5.PatientsPage.query,
                _$3.HomePage.query,
                _$2.DoctorsPage.query,
                _$1.AgendaPage.query,
              ],
        );

  static const signInPage = _$7.SignInPage.query;

  static const newPatientPage = _$4.NewPatientPage.query;

  static const patientDetailPage = _$6.PatientDetailPage.query;

  static const patientsPage = _$5.PatientsPage.query;

  static const homePage = _$3.HomePage.query;

  static const doctorsPage = _$2.DoctorsPage.query;

  static const agendaPage = _$1.AgendaPage.query;

  Map<RouteQueryBuilder, String> queryMap = {
    _$7.SignInPage.query: "/sign_in",
    _$4.NewPatientPage.query: "/patients/new",
    _$6.PatientDetailPage.query: "/patients/detail/:uuid",
    _$5.PatientsPage.query: "/patients",
    _$3.HomePage.query: "/home",
    _$2.DoctorsPage.query: "/doctors",
    _$1.AgendaPage.query: "/agenda",
  };
}
