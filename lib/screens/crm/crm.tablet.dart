part of 'crm.dart';

class _CrmTablet extends StatelessWidget {

  const _CrmTablet();

  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return SideBar(
        child: Container(
          width: context.width,
          height: context.height,
          color: AppColors.gray,
        )
    );
  }
}