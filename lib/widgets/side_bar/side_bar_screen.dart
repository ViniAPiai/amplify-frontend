import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/widgets/side_bar/side_bar_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'side_bar_provider.dart';

part 'side_bar_mobile_screen.dart';

part 'side_bar_tablet_screen.dart';

part 'side_bar_desktop_screen.dart';

class SideBarScreen extends StatefulWidget {

  const SideBarScreen({super.key});

  @override
  createState() => _SideBarScreen();
}

class _SideBarScreen extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SideBarMobileScreen(),
      tablet: (context) => _$SideBarTabletScreen(),
      desktop: (context) => _$SideBarDesktopScreen(),
    );
  }
}