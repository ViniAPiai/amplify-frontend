import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:frontend/bloc/agenda/agenda_bloc.dart';
import 'package:frontend/bloc/agenda/agenda_event.dart';
import 'package:frontend/bloc/auth/auth_bloc.dart';
import 'package:frontend/bloc/auth/auth_event.dart';
import 'package:frontend/bloc/locale/locale_bloc.dart';
import 'package:frontend/bloc/locale/locale_event.dart';
import 'package:frontend/bloc/locale/locale_state.dart';
import 'package:frontend/bloc/patient/patient_bloc.dart';
import 'package:frontend/bloc/side_bar/side_bar_bloc.dart';
import 'package:frontend/bloc/sign_in/sign_in_bloc.dart';
import 'package:frontend/configs/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:frontend/l10n/app_localizations.dart';
import 'package:toastification/toastification.dart';

void main() async {
  const envFile = String.fromEnvironment('ENV', defaultValue: 'assets/.env');
  await dotenv.load(fileName: envFile);
  usePathUrlStrategy();
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    ScreenBreakpoints(desktop: 1100, tablet: 550, watch: 200),
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AuthBloc()..add(AppStarted())),
    BlocProvider(create: (context) => SideBarBloc()),
    BlocProvider(create: (context) => LocaleBloc()..add(LoadSavedLocale())),
    BlocProvider(create: (context) => SignInBloc()),
    BlocProvider(create: (context) => AgendaBloc()..add(LoadSelectedAgendaType())),
    BlocProvider(create: (context) => PatientBloc()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    return BlocBuilder<LocaleBloc, LocaleState>(builder: (context, state) {
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
              textTheme: GoogleFonts.montserratTextTheme(),
              canvasColor: Colors.white,
            ),
            locale: state.locale,
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
            routerConfig: Routes.getRoutes(authBloc),
          ),
        );
      });
    });
  }

  ThemeData _buildThemeData(Brightness brightness) {
    ThemeData themeData = ThemeData(brightness: brightness);
    return themeData.copyWith(textTheme: GoogleFonts.montserratTextTheme());
  }
}
