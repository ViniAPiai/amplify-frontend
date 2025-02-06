part of 'side_bar_screen.dart';

class SideBarItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final String path;

  const SideBarItem({super.key, required this.title, required this.icon, required this.path});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: GoRouter.of(context).state?.path == path ? context.primaryColor : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: FaIcon(icon, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        selected: GoRouter.of(context).state?.path == path,
        selectedTileColor: AppColors.grayBlack,
        onTap: () {
          context.go(path);
        },
      ),
    );
  }
}
