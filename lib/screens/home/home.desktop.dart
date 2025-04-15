part of 'home.dart';

class _$HomeDesktopPage extends StatelessWidget {
  const _$HomeDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    return SideBar(child: SizedBox(width: 100, height: 150, child: ToothEleven()),);
  }
}