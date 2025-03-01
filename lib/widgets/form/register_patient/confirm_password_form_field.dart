import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../label.dart';

class ConfirmPasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback updateShowPassword;
  final bool showPassword;
  final String password;
  final bool enabled;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const ConfirmPasswordFormField(
      {super.key,
      required this.controller,
      required this.updateShowPassword,
      required this.showPassword,
      required this.password,
      required this.enabled, this.currentFocusNode, this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Label(label: t.confirmPassword),
        TextFormField(
          controller: controller,
          focusNode: currentFocusNode,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          },
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: IconButton(onPressed: updateShowPassword, icon: FaIcon(showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye))),
          validator: (value) => MatchValidator(errorText: t.passwordDoesNotMatch).validateMatch(value!, password),
          autovalidateMode: AutovalidateMode.onUnfocus,
          obscureText: !showPassword,
          enabled: enabled,
        )
      ],
    );
  }
}
