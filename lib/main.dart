import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:frontend/configs/auth_notifier.dart';
import 'package:frontend/configs/routes.dart';
import 'package:frontend/screens/home/home_screen.dart';
import 'package:frontend/screens/lading/landing_screen.dart';
import 'package:frontend/screens/sign_in/sign_in_screen.dart';
import 'package:frontend/widgets/side_bar/side_bar_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LandingProvider()),
          ChangeNotifierProvider(create: (_) => SideBarProvider()),
          ChangeNotifierProvider(create: (_) => SignInProvider()),
          ChangeNotifierProvider(create: (_) => HomeProvider()),
          ChangeNotifierProvider(create: (_) => AuthNotifier())
        ],
        child: ResponsiveApp(builder: (context) {
          return MaterialApp.router(
            title: 'Amplify',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              textTheme: GoogleFonts.montserratTextTheme()
            ),
            locale: const Locale('pt', 'PT'),
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
            routerConfig: Routes().getRoutes(context),
          );
        }));
  }

  ThemeData _buildThemeData(Brightness brightness) {
    ThemeData themeData = ThemeData(brightness: brightness);
    return themeData.copyWith(
      textTheme: GoogleFonts.montserratTextTheme()
    );
  }
}
