part of 'landing_screen.dart';

class _$LandingMobileScreen extends StatefulWidget {
  const _$LandingMobileScreen({super.key});

  @override
  createState() => _LandingMobileScreen();
}

class _LandingMobileScreen extends State<_$LandingMobileScreen> {
  @override
  Widget build(BuildContext context) {
    LandingProvider provider = Provider.of<LandingProvider>(context);
    return Scaffold(
      body: PageView(
        controller: provider.controller,
        scrollDirection: Axis.horizontal,
        children: [
          LandingMobileDisplay(color: Colors.yellow),
          LandingMobileDisplay(color: Colors.blue),
          LandingMobileDisplay(color: Colors.red),
          LandingMobileDisplay(color: Colors.purple)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => provider.setPage(2)),
    );
  }
}
