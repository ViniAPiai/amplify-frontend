import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/modals/appointment_details/appointment_details.provider.dart';
import 'package:frontend/models/appointment/appointment_model.dart';
import 'package:frontend/models/appointment/enum/appointment_status_enum.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:frontend/widgets/teeth/dental_arch_painter.dart';
import 'package:frontend/widgets/teeth/teeth_paths.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

part 'appointment_details.desktop.dart';
part 'appointment_details.mobile.dart';

class AppointmentDetailsModal extends StatelessWidget {
  const AppointmentDetailsModal({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => AppointmentDetailsMobile(),
      tablet: (context) => AppointmentDetailsDesktop(width: context.width),
      desktop: (context) => AppointmentDetailsDesktop(width: width),
    );
  }
}
