import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home_provider.dart';

part 'home_mobile_screen.dart';

part 'home_tablet_screen.dart';

part 'home_desktop_screen.dart';

class HomeScreen extends StatefulWidget {

  static final String routeName = 'home';

  const HomeScreen({super.key});

  @override
  createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$HomeMobileScreen(),
      tablet: (context) => _$HomeTabletScreen(),
      desktop: (context) => _$HomeDesktopScreen(),
    );
  }
}