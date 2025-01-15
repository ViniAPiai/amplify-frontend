import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
part 'test_provider.dart';
part 'test_mobile_screen.dart';
part 'test_tablet_screen.dart';
part 'test_desktop_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});
  
  @override
  createState() => _TestScreen();
}

class _TestScreen extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$TestMobileScreen(),
      tablet: (context) => _$TestTabletScreen(),
      desktop: (context) => _$TestDesktopScreen(),
    );
  }
}