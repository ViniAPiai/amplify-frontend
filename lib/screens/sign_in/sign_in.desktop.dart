part of 'sign_in.dart';

class _$SignInDesktop extends StatefulWidget {
  const _$SignInDesktop({required this.signIn});

  final void Function(SignInProvider provider) signIn;

  @override
  createState() => _SignInDesktopScreen();
}

class _SignInDesktopScreen extends State<_$SignInDesktop> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Scaffold(
        backgroundColor: Color(0xff121212),
        body: Consumer<SignInProvider>(builder: (context, provider, child) {
          return Row(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 600,
                    maxWidth: context.mqWidth * .3 < 700
                        ? 700
                        : context.mqWidth * .3),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(32),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.mqHeight * .3,
                        child: SvgPicture.asset(Assets.amplifySecondaryGreen, height: context.mqHeight * .3 * .3,)
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Form(
                          key: provider.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            children: [
                              Label(label: t.email),
                              TextFormField(
                                controller: provider.tecEmail,
                                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                                validator: MultiValidator([
                                  EmailValidator(errorText: "${t.quantity(1)} ${t.email} ${t.validMustBeInformed}"),
                                  RequiredValidator(errorText: "${t.email} ${t.isMandatory}")
                                ]).call,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Label(label: t.password),
                              TextFormField(
                                controller: provider.tecPassword,
                                decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "${t.password} ${t.isMandatory}"),
                                ]).call,
                                autovalidateMode: AutovalidateMode.onUnfocus,
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              FilledButton(
                                  onPressed: () {
                                    if (!provider.isLoading) {
                                      widget.signIn(provider);
                                    }
                                  },
                                  style: FilledButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      backgroundColor: Colors.black,
                                      padding: EdgeInsets.all(16),
                                      fixedSize:
                                          Size(context.mqWidth * .3, 50)),
                                  child: provider.isLoading
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Entrar",
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                              color: Colors.white),
                                        )),
                              TextButton(
                                  onPressed: () => context.router.push(SignUpPage.query()),
                                  child: RichText(
                                    text: TextSpan(
                                        text: "Não tem uma conta? ",
                                        style: GoogleFonts.inter(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        children: [
                                          TextSpan(
                                              text: "Cadastre-se",
                                              style: GoogleFonts.inter(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  decoration:
                                                      TextDecoration.underline))
                                        ]),
                                  ))
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
          );
        }));
  }
}
