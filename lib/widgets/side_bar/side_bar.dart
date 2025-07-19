import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_bloc.dart';
import 'package:frontend/bloc/appointment_details/appointment_details_event.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_bloc.dart';
import 'package:frontend/bloc/new_appointment/new_appointment_event.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_state.dart';
import 'package:frontend/bloc/sign_up/sign_up_bloc.dart';
import 'package:frontend/bloc/sign_up/sign_up_event.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/assets.dart';
import 'package:frontend/modals/appointment_clinical_exam/appointment_clinical_exam.modal.dart';
import 'package:frontend/modals/appointment_details/appointment_details.modal.dart';
import 'package:frontend/modals/new_patient/new_patient_modal.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/screens/crm/crm.dart';
import 'package:frontend/screens/doctors/dentist.dart';
import 'package:frontend/screens/patients/patients.dart';
import 'package:frontend/modals/new_appointment/new_appointment.modal.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
