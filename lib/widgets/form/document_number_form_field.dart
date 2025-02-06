import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'label.dart';

class DocumentNumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final RegExp regExpValidator;
  final MaskTextInputFormatter formatter;
  final bool enabled;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;

  const DocumentNumberFormField(
      {super.key,
      required this.controller,
      required this.enabled,
      required this.regExpValidator,
      required this.formatter,
      required this.currentFocusNode,
      required this.nextFocusNode});

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
        inputFormatters: [formatter],
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        validator: MultiValidator([
          RequiredValidator(errorText: "${t.documentNumber} ${t.isMandatory}"),
          PatternValidator(regExpValidator, errorText: "${t.quantity(1)} ${t.documentNumber} ${t.validMustBeInformed}")
        ]).call,
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
