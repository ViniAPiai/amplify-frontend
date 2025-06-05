import 'package:flutter/material.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class NewConsultationButton extends StatelessWidget {

  final VoidCallback? onPressed;

  const NewConsultationButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return context.isTabletOrDesktop ? OutlinedButton.icon(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        minimumSize: Size(180, 40),
        maximumSize: Size(200, 40)
      ),
      icon: Icon(
        Icons.edit_calendar_outlined,
        color: Colors.grey.shade700,
        size: 24,
      ),
      label: Text(
        t.newAppointment,
        style: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ) :
    OutlinedButton(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        fixedSize: Size(25, 25),
      ),
      child: Center(
        child: Icon(
          Icons.edit_calendar_outlined,
          color: Colors.grey.shade700,
          size: 24,
        ),
      ),
    );
  }
}
