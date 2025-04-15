import 'package:katana_router/katana_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth_notifier.dart';

class AppBoot extends BootRouteQueryBuilder {
  const AppBoot({super.key});

  @override
  Future<void> onInit(BuildContext context) async {
    AuthNotifier authNotifier = context.read<AuthNotifier>();
    await authNotifier.isAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: const [],
    );
  }

  @override
  void onError(BuildContext context, BootRef ref, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  TransitionQuery get initialTransitionQuery => TransitionQuery.fade;
}
