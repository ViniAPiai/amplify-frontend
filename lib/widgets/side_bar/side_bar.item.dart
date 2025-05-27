part of 'side_bar.dart';

class SideBarItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final RouteQuery query;

  const SideBarItem({super.key, required this.title, required this.icon, required this.query});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: context.router.currentQuery == query ? context.primaryColor : Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: FaIcon(icon, color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        // selected: GoRouter.of(context).state?.path == path,
        selectedTileColor: AppColors.grayBlack,
        onTap: () {
          print("Clicado");
          print(query.path);
          context.router.push(query);
        },
      ),
    );
  }
}
