part of 'test_screen.dart';

class _$TestMobileScreen extends StatefulWidget {
  const _$TestMobileScreen({super.key});

  @override
  createState() => _TestMobileScreen();
}

class _TestMobileScreen extends State<_$TestMobileScreen> {
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