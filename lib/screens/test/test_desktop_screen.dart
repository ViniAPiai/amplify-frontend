part of 'test_screen.dart';

class _$TestDesktopScreen extends StatefulWidget {
  const _$TestDesktopScreen({super.key});

  @override
  createState() => _TestDesktopScreen();
}

class _TestDesktopScreen extends State<_$TestDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    TestProvider provider = Provider.of<TestProvider>(context);
    return Scaffold(
      body: Center(child: Text("Contador ${provider.counter}")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.increment(),
        child: Icon(FontAwesomeIcons.plus),),
    );
  }
}