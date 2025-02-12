import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'label.dart';

class OccupationFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const OccupationFormField({super.key, required this.controller, required this.enabled, this.currentFocusNode, this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Label(label: t.occupation),
          TextFormField(
            controller: controller,
            focusNode: currentFocusNode,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            },
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z]$'))],
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
            validator: MultiValidator([
              RequiredValidator(errorText: "${t.occupation} ${t.isMandatory}"),
            ]).call,
            autovalidateMode: AutovalidateMode.onUnfocus,
            enabled: enabled,
          ),
        ]
    );
  }

}