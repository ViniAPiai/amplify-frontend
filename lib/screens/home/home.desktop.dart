part of 'home.dart';

class _$HomeDesktopPage extends StatefulWidget {
  const _$HomeDesktopPage({super.key});

  @override
  State<_$HomeDesktopPage> createState() => _$HomeDesktopPageState();
}

class _$HomeDesktopPageState extends State<_$HomeDesktopPage> {

  final List<ToothCode> selectedTeeth = [];
  final Map<ToothCode, List<Path>> toothPaths = TeethPaths.teethPaths;

  @override
  Widget build(BuildContext context) {
    HomeProvider provider = Provider.of<HomeProvider>(context);
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    DateFormat dateFormat = DateFormat.yMMMd(localeProvider.locale.toString());
    return SideBar(
        child: Stack(
          children: [
          ],
        )
    );
  }

}