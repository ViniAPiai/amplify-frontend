import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../label.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final MaskTextInputFormatter? formatter;
  final List<FieldValidator<dynamic>> validators;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final String label;
  final bool? enabled;

  const CustomFormField(
      {super.key,
      required this.controller,
      required this.formatter,
      required this.validators,
      required this.label,
      this.enabled = true,
      this.currentFocusNode,
      this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: label),
      TextFormField(
        controller: controller,
        inputFormatters: formatter != null ? [formatter!] : [],
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: MultiValidator(validators).call,
        focusNode: currentFocusNode,
        onFieldSubmitted: (value) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
