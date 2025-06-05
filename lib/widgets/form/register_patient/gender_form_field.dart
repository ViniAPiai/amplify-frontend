import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/l10n/app_localizations.dart';

import '../label.dart';

class GenderFormField extends StatelessWidget {
  final String? gender;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const GenderFormField({
    super.key,
    this.gender,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.gender),
      DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffabaaac), width: 2),
            ),
            enabled: enabled),
        value: gender,
        items: ["", t.male, t.female, t.otherGender].map((String state) {
          return DropdownMenuItem<String>(
            value: state,
            child: Text(state),
          );
        }).toList(),
        onChanged: enabled ? (String? newState) {
          onChanged(newState!);
        } : null,
        validator: RequiredValidator(errorText: "${t.gender} ${t.isMandatory}").call,
      ),
    ]);
  }
}
