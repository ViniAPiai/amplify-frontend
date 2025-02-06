import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.label,
    this.required = true,
  });

  final String label;
  final bool required;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: label,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
          children: required
              ? [
                  TextSpan(text: '  *', style: GoogleFonts.inter(color: Colors.red)),
                ]
              : [],
        ),
      ),
    );
  }
}
