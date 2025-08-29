import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/project_layers/presentation_layer/best_seller/best_seller_screen.dart';
import 'package:flower_app/project_layers/presentation_layer/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "flower_app",
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale("en"),
        theme: AppTheme.lightTheme,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: AppRoutes.homeScreen,
        routes: {AppRoutes.homeScreen: (context) => BestSellerScreen()},
      ),
    );
  }
}
