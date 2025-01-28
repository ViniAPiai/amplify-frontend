part of 'sign_in_screen.dart';

class _$SignInDesktopScreen extends StatefulWidget {
  const _$SignInDesktopScreen({required this.signIn});

  final void Function() signIn;

  @override
  createState() => _SignInDesktopScreen();
}

class _SignInDesktopScreen extends State<_$SignInDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    SignInProvider provider = Provider.of<SignInProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xff121212),
      body: Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 600,
              maxWidth: context.mqWidth * .3 < 700 ? 700 : context.mqWidth * .3
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(32),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.mqHeight * .3,
                    child: Center(
                      child: Text(
                        "AMPLIFY",
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w900
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(horizontal: 75),
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 16,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "E-mail",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            )
                          ),
                          TextFormField(
                            controller: provider.tecEmail,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            validator: MultiValidator([
                              EmailValidator(
                                  errorText: "Um e-mail válido deve ser fornecido"),
                              RequiredValidator(errorText: "Um e-mail deve ser fornecido")
                            ]).call,
                            autovalidateMode: AutovalidateMode.onUnfocus,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Senha",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              )
                          ),
                          TextFormField(
                            controller: provider.tecPassword,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "A senha deve ser fornecida"),
                            ]).call,
                            autovalidateMode: AutovalidateMode.onUnfocus,
                          ),
                          SizedBox(height: 32,),
                          FilledButton(
                              onPressed: () => widget.signIn(),
                              style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: Colors.black,
                                  padding: EdgeInsets.all(16),
                                fixedSize: Size(context.mqWidth * .3, 50)
                              ),
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.white),
                              )),
                          TextButton(
                              onPressed: (){},
                              child: RichText(
                                  text: TextSpan(
                                    text: "Não tem uma conta? ",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Cadastre-se",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          decoration: TextDecoration.underline
                                        )
                                      )
                                    ]
                                  ) ,
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
