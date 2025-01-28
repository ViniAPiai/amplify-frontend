part of 'sign_in_screen.dart';

class SignInProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController(text: "vinicius-piai@hotmail.com");
  TextEditingController tecPassword = TextEditingController(text: "V!nicius99");

  Future<bool> signIn(BuildContext context) async {
    if(formKey.currentState!.validate()) {
      AuthRequestModel model = AuthRequestModel(
          tecEmail.text, tecPassword.text);
      try {
        bool authenticated = await AuthService.signIn(model, context);
        return authenticated;
      } catch (e) {
        throw Exception("An error occur during the authentication");
      }
    }
    return false;
  }


  

}
