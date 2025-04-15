// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_field, unused_element, require_trailing_commas, prefer_const_constructors, unnecessary_overrides, prefer_const_literals_to_create_immutables,  unnecessary_null_in_if_null_operators, library_prefixes, directives_ordering, unused_local_variable

part of 'new_patient.dart';

// **************************************************************************
// PageGenerator
// **************************************************************************

@immutable
class _$NewPatientPageQuery extends RouteQueryBuilder {
  const _$NewPatientPageQuery();

  static final _regExp = RegExp(r"^patients/new$");

  @useResult
  RouteQuery call() => _$_NewPatientPageQuery(null);

  @override
  RouteQuery? resolve(String? path) {
    if (path == null) {
      return null;
    }
    if (path.contains("?")) {
      final split = path.split("?");
      final match = _regExp.firstMatch(split.first.trimString("/"));
      if (match == null) {
        return null;
      }
      final query = Uri.splitQueryString(split.last);
      return _$_NewPatientPageQuery(path);
    } else {
      path = path.trimQuery().trimString("/");
      final match = _regExp.firstMatch(path.trimQuery().trimString("/"));
      if (match == null) {
        return null;
      }
      return _$_NewPatientPageQuery(path);
    }
  }
}

@immutable
class _$_NewPatientPageQuery extends RouteQuery {
  const _$_NewPatientPageQuery(this._path);

  final String? _path;

  @override
  String get path => _path ?? "patients/new$_parameters";

  String get _parameters {
    final $q = <String, String>{};
    return $q.isEmpty
        ? ""
        : "?${$q.entries.map((e) => "${e.key}=${e.value}").join("&")}";
  }

  @override
  String get name => path;

  @override
  bool get hidden => false;

  @override
  TransitionQuery? get transition => null;

  @override
  E? key<E>() => null;

  @override
  W? widget<W extends Widget>() {
    final w = NewPatientPage();
    if (w is! W) {
      return null;
    }
    return w as W;
  }

  @override
  List<RedirectQuery> redirect() => const [SignInRequiredRedirectQuery()];

  @override
  AppPageRoute<E> route<E>([TransitionQuery? query]) {
    return AppPageRoute<E>(
      path: path,
      transitionQuery: query ?? transition,
      builder: (context) => NewPatientPage(),
    );
  }
}
