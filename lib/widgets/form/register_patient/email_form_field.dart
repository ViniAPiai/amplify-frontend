import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/l10n/app_localizations.dart';
import '../label.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;
  final bool enabled;

  const EmailFormField({super.key, required this.controller, this.currentFocusNode, this.nextFocusNode, required this.enabled});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Label(label: t.email),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
          validator: MultiValidator([
            RequiredValidator(errorText: "${t.email} ${t.isMandatory}"),
            EmailValidator(errorText: "${t.quantity(1)} ${t.email} ${t.validMustBeInformed}"),
          ]).call,
          autovalidateMode: AutovalidateMode.onUnfocus,
          focusNode: currentFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          keyboardType: TextInputType.emailAddress,
          enabled: enabled,
        ),
      ],
    );
  }
}
