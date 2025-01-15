part of 'test_screen.dart';

class _$TestTabletScreen extends StatefulWidget {
  const _$TestTabletScreen({super.key});

  @override
  createState() => _TestTabletScreen();
}

class _TestTabletScreen extends State<_$TestTabletScreen> {
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