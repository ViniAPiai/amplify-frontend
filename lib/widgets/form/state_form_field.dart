import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'label.dart';

class StateFormField<T> extends StatelessWidget {
  final String? state;
  final List<String> states;
  final bool enabled;
  final ValueChanged<String> onChanged;

  const StateFormField(
      {super.key, required this.states, required this.enabled, this.state, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.state),
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
        value: state,
        items: states.map((String state) {
          return DropdownMenuItem<String>(
            value: state,
            child: Text(state),
          );
        }).toList(),
        onChanged: enabled ? (String? newState) {
          onChanged(newState!);
        } : null,
        validator: RequiredValidator(errorText: "${t.state} ${t.isMandatory}").call,
      ),
    ]);
  }
}
