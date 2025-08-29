import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_in/login_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/sign_up_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'core/l10n/app_localizations.dart';
import 'core/route/app_routes.dart';
import 'core/route/routes.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flower_app",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("en"),
      theme: AppTheme.lightTheme,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: AppRoutes.loginScreen,
      routes: {
        AppRoutes.loginScreen: (context) => SignInView(),
        AppRoutes.signUpScreen: (context) => SignUpView(),
        AppRoutes.homeScreen: (context) => HomeScreen(),
      },
    );
  }
}
