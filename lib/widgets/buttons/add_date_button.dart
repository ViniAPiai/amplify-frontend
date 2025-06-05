import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/configs/app_colors.dart';

class AddDateButton extends StatelessWidget {
  const AddDateButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return OutlinedButton.icon(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      ),
      icon: Icon(
        Icons.add,
        color: Colors.grey.shade700,
        size: 24,
      ),
      label: Text(
        t.addDate,
        style: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
