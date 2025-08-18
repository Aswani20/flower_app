import 'package:flutter/material.dart';
import 'core/l10n/translation/app_localizations.dart';
import 'core/route/app_routes.dart';
import 'core/route/routes.dart';
import 'core/theme/app_theme.dart';

void main(){
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
      //initialRoute: ,
      routes: {},
    );
  }
}
