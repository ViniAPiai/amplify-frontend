import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/l10n/app_localizations.dart';
import '../label.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool showPassword;
  final VoidCallback updateShowPassword;
  final bool enabled;

  const PasswordFormField({super.key, required this.controller, required this.updateShowPassword, required this.showPassword, required this.enabled});

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Label(label: t.password),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: IconButton(onPressed: updateShowPassword, icon: FaIcon(showPassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye))),
          validator: MultiValidator([
            RequiredValidator(errorText: '${t.password} ${t.isMandatory}'),
            MinLengthValidator(8, errorText: t.passwordLengthRule),
            PatternValidator(r'(?=.*?[#?!@$%^&*-])', errorText: t.passwordSpecialCharacterRule)
          ]).call,
          autovalidateMode: AutovalidateMode.onUnfocus,
          obscureText: !showPassword,
          enabled: enabled,
        ),
      ],
    );
  }
}
