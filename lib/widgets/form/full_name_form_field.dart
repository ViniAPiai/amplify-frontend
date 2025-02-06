import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:frontend/widgets/form/label.dart';

class FullNameFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode currentFocusNode;
  final FocusNode nextFocusNode;
  final bool enabled;

  const FullNameFormField({super.key, required this.controller, required this.currentFocusNode, required this.nextFocusNode, required this.enabled});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Label(label: t.fullName),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          validator: RequiredValidator(errorText: "${t.fullName} ${t.isMandatory}").call,
          autovalidateMode: AutovalidateMode.onUnfocus,
          focusNode: currentFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          enabled: enabled,
        ),
      ],
    );
  }
}
