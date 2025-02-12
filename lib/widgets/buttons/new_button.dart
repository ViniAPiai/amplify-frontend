import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/configs/app_colors.dart';

class NewButton extends StatelessWidget {

  const NewButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: context.primaryColor)),
          padding: EdgeInsets.all(16)),
      label: Text(
        AppLocalizations.of(context)!.newPatient,
        style: GoogleFonts.inter(
          color: context.primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      icon: Icon(
        Icons.add,
        color: context.primaryColor,
        size: 16,
      ),
    );
  }
}
