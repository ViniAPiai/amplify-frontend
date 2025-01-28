part of 'sign_in_screen.dart';

class _$SignInMobileScreen extends StatefulWidget {

  const _$SignInMobileScreen({required this.signIn});

  final void Function() signIn;

  @override
  createState() => _SignInMobileScreen();
}

class _SignInMobileScreen extends State<_$SignInMobileScreen> {
  @override
  Widget build(BuildContext context) {
    SignInProvider provider = Provider.of<SignInProvider>(context);
    return Scaffold();
  }
}