import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'label.dart';

class CityFormField extends StatelessWidget {
  final String? city;
  final List<String> cities;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const CityFormField({super.key, required this.enabled, required this.cities, required this.city, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Label(label: t.city),
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
            value: city,
            items: cities.map((String city) {
              return DropdownMenuItem<String>(
                value: city,
                child: Text(city),
              );
            }).toList(),
            onChanged: enabled ? (String? newCity) {
              onChanged(newCity!);
            } : null,
            validator: RequiredValidator(errorText: "${t.city} ${t.isMandatory}").call,
          ),
        ]
    );
  }

}