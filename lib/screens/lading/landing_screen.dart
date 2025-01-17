import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/widgets/landing/landing_desktop_features_card.dart';
import 'package:frontend/widgets/landing/landing_desktop_plan_card.dart';
import 'package:frontend/widgets/landing/landing_mobile_display.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'landing_provider.dart';

part 'landing_mobile_screen.dart';

part 'landing_tablet_screen.dart';

part 'landing_desktop_screen.dart';

class LandingScreen extends StatefulWidget {

  static final String routeName = 'landing';

  const LandingScreen({super.key});

  @override
  createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$LandingMobileScreen(),
      tablet: (context) => _$LandingTabletScreen(),
      desktop: (context) => _$LandingDesktopScreen(),
    );
  }
}