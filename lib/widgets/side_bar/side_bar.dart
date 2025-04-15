import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/main.router.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/widgets/consultation/consultation_modal.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'side_bar.provider.dart';

part 'side_bar.mobile.dart';

part 'side_bar.tablet.dart';

part 'side_bar.desktop.dart';

part 'side_bar.item.dart';

class SideBar extends StatefulWidget {
  final PreferredSize? appBar;
  final Widget child;

  const SideBar({super.key, required this.child, this.appBar});

  @override
  createState() => _SideBar();
}

class _SideBar extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SideBarMobile(
        appBar: widget.appBar,
        child: widget.child,
      ),
      tablet: (context) => _$SideBarTablet(
        appBar: widget.appBar,
        child: widget.child,
      ),
      desktop: (context) => _$SideBarDesktop(child: widget.child),
    );
  }
}
