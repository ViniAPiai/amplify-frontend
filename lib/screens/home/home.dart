import 'package:flutter/material.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'home.provider.dart';
part 'home.mobile.dart';
part 'home.tablet.dart';
part 'home.desktop.dart';

class HomePage extends StatelessWidget {

  static const String routeName = 'home';
  static const String route = '/$routeName';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$HomeMobilePage(),
      tablet: (context) => _$HomeTabletPage(),
      desktop: (context) => _$HomeDesktopPage(),
    );
  }
}