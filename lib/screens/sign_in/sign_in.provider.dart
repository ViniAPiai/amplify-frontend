part of 'sign_in.dart';

class SignInProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tecEmail = TextEditingController(text: "tester.secretary@example.com");
  TextEditingController tecPassword = TextEditingController(text: "T&ste1");
  bool isLoading = false;

  Future<bool> signIn(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      AuthResponseModel response =
          await (await ApiService.create(withAuth: false)).client.signIn(AuthRequestModel(email: tecEmail.text, password: tecPassword.text));
      if (response.token.isNotEmpty) {
        SharedPreferences shared = await SharedPreferences.getInstance();
        shared.setString("token", response.token);
        shared.setString("expiresIn", response.expiresIn.toIso8601String());
        isLoading = false;
        notifyListeners();
        return true;
      }
      return false;
    }
    return false;
  }
}
