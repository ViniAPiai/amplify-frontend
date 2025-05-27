import 'package:flutter/material.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';

class TimePickerButton extends StatelessWidget {
  const TimePickerButton({super.key, required this.time, required this.onChanged, required this.label, required this.enabled, required this.index});

  final String label;
  final TimeOfDay time;
  final bool enabled;
  final int index;
  final ValueChanged<TimeOfDay> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        index == 0 ? Label(label: label) : const SizedBox(),
        IgnorePointer(
          ignoring: enabled,
          child: SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                TimeOfDay? t = await showTimePicker(context: context, initialTime: time);
                if (t != null) {
                  onChanged(t);
                }
              },
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                backgroundColor: Colors.white,
                padding: EdgeInsets.zero,
              ),
              iconAlignment: IconAlignment.end,
              icon: Icon(
                Icons.start,
                color: Colors.grey.shade700,
                size: 24,
              ),
              label: Text(
                MaterialLocalizations.of(context).formatTimeOfDay(time),
                style: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
