import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/modals/appointment_clinical_exam/appointment_clinical_exam.modal.dart';
import 'package:frontend/modals/appointment_details/appointment_details.modal.dart';
import 'package:frontend/modals/appointment_details/appointment_details.provider.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/clinical_exam/clinical_exam.model.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/screens/doctors/doctors.dart';
import 'package:frontend/screens/patients/patients.dart';
import 'package:frontend/modals/new_appointment/new_appointment.provider.dart';
import 'package:frontend/modals/new_appointment/new_appointment.modal.dart';
import 'package:frontend/services/api_service.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:frontend/l10n/app_localizations.dart';

part 'side_bar.provider.dart';

part 'side_bar.mobile.dart';

part 'side_bar.tablet.dart';

part 'side_bar.desktop.dart';

part 'side_bar.item.dart';

class SideBar extends StatefulWidget {
  final PreferredSize? appBar;
  final Widget? bottom;
  final Widget child;

  const SideBar({super.key, required this.child, this.appBar, this.bottom});

  @override
  createState() => _SideBar();
}

class _SideBar extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _$SideBarMobile(
        appBar: widget.appBar,
        bottom: widget.bottom,
        child: widget.child,
      ),
      tablet: (context) => _$SideBarTablet(
        appBar: widget.appBar,
        bottom: widget.bottom,
        child: widget.child,
      ),
      desktop: (context) => _$SideBarDesktop(child: widget.child),
    );
  }
}
