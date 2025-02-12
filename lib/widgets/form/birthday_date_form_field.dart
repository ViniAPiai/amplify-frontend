import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'label.dart';

class BirthdayDateFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const BirthdayDateFormField(
      {super.key, required this.controller, required this.enabled, this.currentFocusNode, this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.birthDate),
      TextFormField(
        controller: controller,
        focusNode: currentFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        keyboardType: TextInputType.datetime,
        inputFormatters: [
          MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')})
        ],
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        validator: MultiValidator([
          RequiredValidator(errorText: "${t.birthDate} ${t.isMandatory}"),
          PatternValidator(RegExp(r'd{2}/d{2}/d{4}'), errorText: "${t.quantity(1)} ${t.birthDate} ${t.validMustBeInformed}")
        ]).call,
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
