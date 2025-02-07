import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/assets.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'side_bar_provider.dart';

part 'side_bar_mobile_screen.dart';

part 'side_bar_tablet_screen.dart';

part 'side_bar_desktop_screen.dart';

part 'side_bar_item.dart';

class SideBarScreen extends StatefulWidget {
  final PreferredSize? appBar;
  final Widget child;

  const SideBarScreen({super.key, required this.child, this.appBar});

  @override
  createState() => _SideBarScreen();
}

class _SideBarScreen extends State<SideBarScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SideBarMobileScreen(
        appBar: widget.appBar,
        child: widget.child,
      ),
      tablet: (context) => _$SideBarTabletScreen(
        appBar: widget.appBar,
        child: widget.child,
      ),
      desktop: (context) => _$SideBarDesktopScreen(child: widget.child),
    );
  }
}
