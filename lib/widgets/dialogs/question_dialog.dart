part of 'amplify_dialog.dart';

class _QuestionDialog extends StatelessWidget {
  const _QuestionDialog({required this.message, this.onTapConfirm, this.onTapCancel, this.confirmButtonText, this.cancelButtonText});

  final String message;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final VoidCallback? onTapConfirm;
  final VoidCallback? onTapCancel;

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 340,
          minHeight: 200,
          maxWidth: 340,
          maxHeight: 340,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.question_answer_outlined,
              color: Colors.lightBlue,
              size: 64,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              message,
              style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ).alignAtCenter().expanded(),
            Row(
              spacing: 16,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      fixedSize: Size(154, 50),
                    ),
                    onPressed: () => onTapCancel ?? Navigator.pop(context),
                    child:
                        Text(cancelButtonText ?? t.cancel, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500))),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      fixedSize: Size(154, 50),
                    ),
                    onPressed: () => onTapConfirm ?? Navigator.pop(context),
                    child:
                        Text(confirmButtonText ?? t.okay, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)))
              ],
            )
          ],
        ),
      ),
    ).alignAtCenter();
  }
}
