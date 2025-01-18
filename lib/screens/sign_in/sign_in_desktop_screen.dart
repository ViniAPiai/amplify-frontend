part of 'sign_in_screen.dart';

class _$SignInDesktopScreen extends StatefulWidget {
  const _$SignInDesktopScreen({super.key});

  @override
  createState() => _SignInDesktopScreen();
}

class _SignInDesktopScreen extends State<_$SignInDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    SignInProvider provider = Provider.of<SignInProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          child: Container(
            width: context.mqWidth * .4,
            height: context.mqHeight * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey
            ),
            child: TextButton(onPressed: (){
              UserService.me();
            }, child: Text("ME")),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        AuthService.signIn(AuthRequestModel("vinicius-piai@hotmail.com", "V!nicius99"));
      }),
    );
  }
}