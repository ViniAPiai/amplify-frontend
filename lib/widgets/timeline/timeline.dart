import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

enum TimelineStep { current, past, next }

class Timeline extends StatelessWidget {
  const Timeline({
    super.key,
    this.isFirst = false,
    this.isLast = false,
    this.title = '',
    required this.step,
  });

  final bool isFirst;
  final bool isLast;
  final TimelineStep step;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(color: AppColors.primary, thickness: 3),
        indicatorStyle: step == TimelineStep.past || step == TimelineStep.current
            ? IndicatorStyle(
                color: AppColors.primary,
                width: 30,
                iconStyle: IconStyle(iconData: step == TimelineStep.past ? Icons.check : Icons.circle, color: Colors.white))
            : IndicatorStyle(
                color: AppColors.primary,
                width: 30,
              ),
        endChild: Text(
          title,
          style: GoogleFonts.montserrat(color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.w500),
        )
      ),
    ).paddingOnly(left: 16);
  }
}
