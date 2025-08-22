import 'package:flower_app/core/route/app_routes.dart';
import 'package:flutter/material.dart';
import 'core/di/di.dart';
import 'core/l10n/translation/app_localizations.dart';
import 'core/route/routes.dart';
import 'core/theme/app_theme.dart';
import 'project_layers/presentation_layer/authentication/forget_password/forget_password_view.dart';

void main() async{
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
      initialRoute: AppRoutes.forgetPasswordScreen,
      routes: {
        AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordView(),
      },
    );
  }
}
