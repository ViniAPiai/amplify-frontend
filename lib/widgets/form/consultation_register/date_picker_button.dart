import 'package:flutter/material.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/extension/utils_extension.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/widgets/form/label.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DatePickerButton extends StatelessWidget {
  const DatePickerButton({super.key, required this.enabled});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    AgendaProvider agendaProvider = Provider.of<AgendaProvider>(context);
    LocaleProvider locale = Provider.of<LocaleProvider>(context);
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Label(label: t.dateLabel),
      IgnorePointer(
        ignoring: enabled,
        child: SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                  context: context, currentDate: agendaProvider.consultationDate, firstDate: DateTime(2025, 1, 1), lastDate: DateTime(2030, 1, 1));
              if (date != null) {
                agendaProvider.updateConsultationDate(date);
              }
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: BorderSide(color: Colors.grey.shade50)),
                backgroundColor: Colors.white,
                padding: EdgeInsets.zero,
            ),
            iconAlignment: IconAlignment.end,
            icon: context.isTabletOrDesktop ? Icon(
              Icons.calendar_month,
              color: Colors.grey.shade700,
              size: 24,
            ) : null,
            label: Text(
              DateFormat.yMd(locale.getLocaleString()).format(agendaProvider.consultationDate),
              style: GoogleFonts.inter(color: Colors.grey.shade700, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    ]);
  }
}
