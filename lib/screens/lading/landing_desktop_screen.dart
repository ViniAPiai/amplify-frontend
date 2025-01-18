part of 'landing_screen.dart';

class _$LandingDesktopScreen extends StatefulWidget {
  const _$LandingDesktopScreen({super.key});

  @override
  createState() => _LandingDesktopScreen();
}

class _LandingDesktopScreen extends State<_$LandingDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    LandingProvider provider = Provider.of<LandingProvider>(context);
    var t = AppLocalizations.of(context)!;
    List<String> items = [t.landingNavbarFeatures, t.landingNavbarAboutUs,
      t.landingNavbarPricing];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(context.mqWidth, 100),
          child: Container(
            width: context.mqWidth,
            height: 100,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              spacing: 16,
              children: [
                TextButton(
                    onPressed: () => provider.setPage(0),
                    child: Text(
                      "Amplify",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                ),
                Expanded(child: SizedBox()),
                ...items.map((e) {
                  return TextButton(
                      onPressed: () {
                        provider.setPage(items.indexOf(e) + 1);
                      },
                      child: Text(
                        e,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ));
                }),
                Expanded(child: SizedBox()),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(color: Colors.black)),
                        minimumSize: Size(175, 50)),
                    child: Text(
                      t.landingNavbarSignIn,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        minimumSize: Size(175, 50)),
                    child: Text(
                      t.landingNavbarSignUp,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ))
              ],
            ),
          )),
      body: PageView(
        controller: provider.controller,
        scrollDirection: Axis.vertical,
        children: [
          Container(
              width: context.mqWidth,
              height: context.mqHeight,
              color: Colors.white,
              padding: EdgeInsets.all(context.mqHeight * .1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    spacing: 32,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.landingFirstScreenTitle,
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        t.landingFirstScreenSubTitle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                              Assets.googlePlayBadge,
                            scale: 1.5,
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: context.mqWidth * .4,
                    height: context.mqHeight,
                    color: Colors.blue,
                    child: Center(child: Text(
                        "IMAGEM DO APP",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 80
                      ),
                    )),
                  )
                ],
              )),
          Container(
            width: context.mqWidth,
            height: context.mqHeight,
            color: Colors.white,
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Todos os módulos disponíveis",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 8,),
                Text(
                  "De acordo com o plano escolhido",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 32,
                  children: [
                    LandingDesktopFeaturesCard(
                        icon: FontAwesomeIcons.receipt,
                        title: t.landingSecondScreenFinanceTitle,
                        subTitle: t.landingSecondScreenFinanceDescription
                    ),
                    LandingDesktopFeaturesCard(
                        icon: FontAwesomeIcons.userGroup,
                        title: t.landingSecondScreenHRTitle,
                        subTitle: t.landingSecondScreenHRDescription
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: context.mqWidth,
            height: context.mqHeight,
            color: Colors.green,
          ),
          Container(
            width: context.mqWidth,
            height: context.mqHeight,
            padding: EdgeInsets.all(32),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  t.landingFourthScreenTitle,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  t.landingFourthScreenSubTitle,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey
                  ),
                ),
                const SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 32,
                  children: [
                    LandingDesktopPlanCard(title: t.landingFourthBasicPlan, blockFrom: 2),
                    LandingDesktopPlanCard(title: t.landingFourthMediumPlan, blockFrom: 3),
                    LandingDesktopPlanCard(title: t.landingFourthPremiumPlan, blockFrom: 6)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
