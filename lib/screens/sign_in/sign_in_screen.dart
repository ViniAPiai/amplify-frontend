import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'sign_in_provider.dart';

part 'sign_in_mobile_screen.dart';

part 'sign_in_tablet_screen.dart';

part 'sign_in_desktop_screen.dart';

class SignInScreen extends StatefulWidget {

  static final String routeName = 'sign_in';

  const SignInScreen({super.key});

  @override
  createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SignInMobileScreen(),
      tablet: (context) => _$SignInTabletScreen(),
      desktop: (context) => _$SignInDesktopScreen(),
    );
  }
}