
part of 'amplify_dialog.dart';

class _SuccessDialog extends StatelessWidget {

  const _SuccessDialog({required this.message, this.onTap});

  final String message;
  final VoidCallback? onTap;

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
              Icons.check_circle_outline_outlined,
              color: AppColors.primary,
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  fixedSize: Size(308, 50),
                ),
                onPressed: () => onTap ?? Navigator.pop(context),
                child: Text(t.okay, style: GoogleFonts.inter(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)))
          ],
        ),
      ),
    ).alignAtCenter();
  }
}
