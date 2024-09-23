import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:paris_janitor/Blocs/Filter_bloc/filter_bloc.dart';
import 'package:paris_janitor/ScreensAndWidgets/HomeScreen/Screens/home_screen.dart';
import 'package:paris_janitor/ScreensAndWidgets/LogInAndSignUp/Screens/login_screen.dart';
import 'package:paris_janitor/ScreensAndWidgets/LogInAndSignUp/Screens/sign_up_screen.dart';

import 'ScreensAndWidgets/LogInAndSignUp/Screens/forgotten_password_screen.dart';
import 'ScreensAndWidgets/LogInAndSignUp/Screens/main_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => FilterBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paris Janitor',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MainScreen(),
        '/forgottenPassword': (context) => const ForgottenPasswordScreen(),
        '/home': (context) => const HomeScreen()
      },
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/loginScreen':
            final arguments = settings.arguments;
            if (arguments is String) {
              return MaterialPageRoute(
                builder: (context) => LoginScreen(
                  mail: arguments,
                ),
              );
            }
            break;
          case '/signupScreen':
            final arguments = settings.arguments;
            if (arguments is String) {
              return MaterialPageRoute(
                builder: (context) => SignUpScreen(
                  mail: arguments,
                ),
              );
            }
        }
      },
    );
  }
}
