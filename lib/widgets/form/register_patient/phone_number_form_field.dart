import 'package:flutter/material.dart';
import 'package:frontend/extension/mask_formatter_extension.dart';
import 'package:frontend/extension/validator_extension.dart';
import 'package:frontend/l10n/app_localizations.dart';
import '../label.dart';

class PhoneNumberFormField extends StatelessWidget {
  final TextEditingController controller;
  final String country;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const PhoneNumberFormField(
      {super.key, required this.controller, required this.enabled, this.currentFocusNode, this.nextFocusNode, required this.country});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(spacing: 16, mainAxisAlignment: MainAxisAlignment.start, children: [
      Label(label: t.phoneNumber),
      TextFormField(
        controller: controller,
        focusNode: currentFocusNode,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        keyboardType: TextInputType.phone,
        inputFormatters: [context.phoneFormatter(country)],
        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        validator: (value) {
          if(value == null || value.isEmpty) {
            return "${t.phoneNumber} ${t.isMandatory}";
          }
          if(!context.phoneValidator(country).hasMatch(value)) {
            return "${t.phoneNumber} ${t.validMustBeInformed}";
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUnfocus,
        enabled: enabled,
      ),
    ]);
  }
}
