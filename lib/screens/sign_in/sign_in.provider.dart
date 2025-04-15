part of 'sign_in.dart';

class SignInProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController(text: "tester.secretary@example.com");
  TextEditingController tecPassword = TextEditingController(text: "T&ste1");
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
