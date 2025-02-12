import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoShower extends StatelessWidget {
  const InfoShower({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.gray, width: 1))),
      padding: EdgeInsets.only(bottom: 8),
      child: RichText(
          text: TextSpan(text: label, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey), children: [
        TextSpan(
          text: "\n$value",
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w300, color: AppColors.black),
        )
      ])),
    );
  }
}
