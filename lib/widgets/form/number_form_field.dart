import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'label.dart';

class NumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;

  const NumberFormField({super.key, required this.controller, required this.enabled, required this.currentFocusNode, required this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Label(label: t.number),
          TextFormField(
            controller: controller,
            focusNode: currentFocusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            validator: RequiredValidator(errorText: "${t.number} ${t.isMandatory}").call,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            autovalidateMode: AutovalidateMode.onUnfocus,
            enabled: enabled,
          ),
        ]
    );
  }

}