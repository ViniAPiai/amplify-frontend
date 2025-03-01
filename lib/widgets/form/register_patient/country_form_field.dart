import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../label.dart';

class CountryFormField extends StatelessWidget {
  final String? country;
  final Function(String) onChanged;
  final bool enabled;

  const CountryFormField({
    super.key,
    required this.onChanged, this.country, required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(label: t.country),
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
            enabled: enabled
          ),
          value: country,
          items: ["", "Brasil", "Portugal"].map((String state) {
            return DropdownMenuItem<String>(
              value: state,
              child: Text(state),
            );
          }).toList(),
          onChanged: (String? newCountry) {
            onChanged(newCountry!);
          },
          validator: RequiredValidator(errorText: "${t.country} ${t.isMandatory}").call,
        ),
      ],
    );
  }
}
