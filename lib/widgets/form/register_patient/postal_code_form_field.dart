import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/extension/hint_extension.dart';
import 'package:frontend/extension/mask_formatter_extension.dart';
import 'package:frontend/extension/validator_extension.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../label.dart';

class ZipCodeFormField extends StatelessWidget {
  final TextEditingController controller;
  final String country;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const ZipCodeFormField(
      {super.key, required this.controller, required this.enabled, this.currentFocusNode, this.nextFocusNode, required this.country});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.zipCode),
      TextFormField(
        controller: controller,
        focusNode: currentFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        keyboardType: TextInputType.number,
        inputFormatters: [context.getZipCodeFormatter(country)],
        decoration:
            InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), hintText: context.getPostalCodeHint(country)),
        validator: (value) {
          if(value == null || value.isEmpty) {
            return "${t.zipCode} ${t.isMandatory}";
          }
          if(!context.getPostalCodeValidator(country).hasMatch(value)) {
            return "${t.zipCode} ${t.validMustBeInformed}";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
