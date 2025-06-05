import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:frontend/configs/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:frontend/l10n/app_localizations.dart';

part 'success_dialog.dart';

part 'error_dialog.dart';

part 'question_dialog.dart';

class AmplifyDialog {
  static void success(
    BuildContext context, {
    required String message,
  }) =>
      showDialog(context: context, builder: (context) => _SuccessDialog(message: message));

  static void error(
    BuildContext context, {
    required String message,
  }) =>
      showDialog(context: context, builder: (context) => _ErrorDialog(message: message));

  static void question(
    BuildContext context, {
    required String message,
    String? confirmButtonText,
    String? cancelButtonText,
    VoidCallback? onTapConfirm,
    VoidCallback? onTapCancel,
  }) =>
      showDialog(
          context: context,
          builder: (context) => _QuestionDialog(
              message: message,
              confirmButtonText: confirmButtonText,
              cancelButtonText: cancelButtonText,
              onTapConfirm: onTapConfirm,
              onTapCancel: onTapCancel));
}
