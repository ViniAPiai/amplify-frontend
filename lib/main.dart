import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:frontend/configs/app_boot.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/configs/locale_provider.dart';
import 'package:frontend/configs/sign_in_required_redirect_query.dart';
import 'package:frontend/screens/agenda/agenda.dart';
import 'package:frontend/screens/doctors/doctors.dart';
import 'package:frontend/screens/home/home.dart';
import 'package:frontend/screens/new_patient/new_patient.dart';
import 'package:frontend/screens/patient_detail/patient_detail.dart';
import 'package:frontend/screens/patients/patients.dart';
import 'package:frontend/screens/sign_in/sign_in.dart';
import 'package:frontend/screens/sign_up/sign_up.dart';
import 'package:frontend/widgets/side_bar/side_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katana_router/katana_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';

import 'main.router.dart';

@appRoute
final appRouter = AutoRouter(
  initialQuery: SignInPage.query(),
  boot: AppBoot()
);

void main() async {
  const apiUrl = String.fromEnvironment("API_URL");
  print("API_URL em tempo de execução: $apiUrl");
  usePathUrlStrategy();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 1100, tablet: 550, watch: 200),
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SideBarProvider()),
      ChangeNotifierProvider(create: (_) => SignInProvider()),
      ChangeNotifierProvider(create: (_) => SignUpProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ChangeNotifierProvider(create: (_) => PatientsProvider()),
      ChangeNotifierProvider(create: (_) => AgendaProvider()),
      ChangeNotifierProvider(create: (_) => DoctorsProvider()),
      ChangeNotifierProvider(create: (_) => NewPatientProvider()),
      ChangeNotifierProvider(create: (_) => PatientDetailProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    LocaleProvider value = Provider.of<LocaleProvider>(context, listen: true);
    return ResponsiveApp(builder: (context) {
      return ToastificationWrapper(
        config: ToastificationConfig(
          alignment: Alignment.topRight,
        ),
        child: MaterialApp.router(
            title: 'Amplify',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff2b660b)),
              primaryColor: Color(0xff73d53f),
              useMaterial3: true,
              textTheme: GoogleFonts.interTextTheme(),
              canvasColor: Colors.white,
            ),
            locale: value.locale,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', 'US'),
              Locale('pt', 'PT'),
              Locale('pt', 'BR'),
            ],
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter),
      );
    });
  }

  ThemeData _buildThemeData(Brightness brightness) {
    ThemeData themeData = ThemeData(brightness: brightness);
    return themeData.copyWith(textTheme: GoogleFonts.montserratTextTheme());
  }
}
