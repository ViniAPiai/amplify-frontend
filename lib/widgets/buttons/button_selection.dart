import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSelection extends StatelessWidget {

  const ButtonSelection({super.key, required this.onPressed, required this.text, required this.condition});

  final VoidCallback onPressed;
  final String text;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gray,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          alignment: Alignment.centerLeft
      ),
      label: Text(text, style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),),
      icon: Icon(Icons.check_circle, color: condition ? AppColors.primary : AppColors.gray, size: 24),
    ).expanded();
  }
}
