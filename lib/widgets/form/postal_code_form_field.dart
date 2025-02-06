import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'label.dart';

class PostalCodeFormField extends StatelessWidget {
  final TextEditingController controller;
  final PatternValidator postalCodeValidator;
  final MaskTextInputFormatter formatter;
  final String hintText;
  final bool enabled;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;

  const PostalCodeFormField(
      {super.key,
      required this.controller,
      required this.postalCodeValidator,
      required this.formatter,
      required this.hintText,
      required this.enabled,
      required this.currentFocusNode,
      required this.nextFocusNode});

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
        inputFormatters: [formatter],
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), hintText: hintText),
        validator: MultiValidator([RequiredValidator(errorText: "${t.zipCode} ${t.isMandatory}"), postalCodeValidator]).call,
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
