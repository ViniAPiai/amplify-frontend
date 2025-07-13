import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/enums/tooth_code.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/teeth/dental_arch_painter.dart';
import 'package:frontend/widgets/teeth/teeth_paths.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

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