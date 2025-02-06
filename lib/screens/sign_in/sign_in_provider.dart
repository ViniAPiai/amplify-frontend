part of 'sign_in_screen.dart';

class SignInProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController(text: "vinicius-piai@hotmail.com");
  TextEditingController tecPassword = TextEditingController(text: "V!nicius99");
  bool isLoading = false;

  Future<bool> signIn(BuildContext context) async {
    if(formKey.currentState!.validate()) {
      AuthRequestModel model = AuthRequestModel(
          tecEmail.text, tecPassword.text);
      isLoading = true;
      notifyListeners();
      try {
        bool authenticated = await AuthService.signIn(model, context);
        isLoading = false;
        notifyListeners();
        return authenticated;
      } catch (e) {
        isLoading = false;
        notifyListeners();
        throw Exception("An error occur during the authentication");
      }
    }
    isLoading = false;
    notifyListeners();
    return false;
  }


  

}
