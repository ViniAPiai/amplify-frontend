import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/extension/mask_formatter_extension.dart';
import 'package:frontend/extension/validator_extension.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../label.dart';

class DocumentNumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final String country;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const DocumentNumberFormField(
      {super.key, required this.controller, required this.enabled, this.currentFocusNode, this.nextFocusNode, required this.country});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.documentNumber),
      TextFormField(
        controller: controller,
        focusNode: currentFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        keyboardType: TextInputType.number,
        inputFormatters: [context.documentNumberFormatter(country)],
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        validator: (value) {
          if(value == null || value.isEmpty) {
           return "${t.documentNumber} ${t.isMandatory}";
          }
          if(!context.documentNumberValidator(country).hasMatch(value)) {
             return "${t.quantity(1)} ${t.documentNumber} ${t.validMustBeInformed}";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
