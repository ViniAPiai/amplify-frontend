part of 'sign_in.dart';

class _$SignInTablet extends StatefulWidget {
  const _$SignInTablet({required this.signIn});

  final void Function(SignInProvider provider) signIn;

  @override
  createState() => _SignInTabletScreen();
}

class _SignInTabletScreen extends State<_$SignInTablet> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations t = AppLocalizations.of(context)!;
    return Scaffold(
      body: Consumer<SignInProvider>(builder: (context, provider, child) {
        return Container(
          color: Colors.white,
          width: context.mqWidth,
          padding: EdgeInsets.all(32),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                  height: context.mqHeight * .3,
                  child: SvgPicture.asset(
                    Assets.amplifySecondaryGreen,
                    height: context.mqHeight * .3 * .3,
                  )),
              Container(
                color: Colors.white,
                width: context.mqWidth,
                margin: EdgeInsets.symmetric(horizontal: 75),
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
                              fixedSize: Size(context.mqWidth, 50)),
                          child: provider.isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  t.signIn,
                                  style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                                )),
                      TextButton(
                          onPressed: () => context.go(SignUpPage.route),
                          child: RichText(
                            text: TextSpan(
                                text: t.doNotHaveAccount,
                                style: GoogleFonts.inter(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16),
                                children: [
                                  TextSpan(
                                      text: t.signUp,
                                      style: GoogleFonts.inter(
                                          color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 16, decoration: TextDecoration.underline))
                                ]),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
