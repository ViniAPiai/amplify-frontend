import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'sign_up_provider.dart';

part 'sign_up_mobile_screen.dart';

part 'sign_up_tablet_screen.dart';

part 'sign_up_desktop_screen.dart';

class SignUpScreen extends StatefulWidget {

  static final String routeName = 'sign_up';

  const SignUpScreen({super.key});

  @override
  createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignUpMobileScreen(),
      tablet: (context) => _$SignUpTabletScreen(),
      desktop: (context) => _$SignUpDesktopScreen(),
    );
  }
}