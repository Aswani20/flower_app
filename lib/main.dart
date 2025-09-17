import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/di/modules/shared_preferences_module.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/forget_password/forget_password_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_in/login_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/sign_up_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/best_seller/best_seller_screen.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/home_screen.dart';
import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/keys/shared_key.dart';
import 'core/route/app_routes.dart';
import 'core/route/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/language_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper().instantiatePreferences();
  final token = SharedPrefHelper().getString(
    key: SharedPrefKeys.tokenKey,
  );
  await configureDependencies();
  // runApp(MyApp(token: token));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<CartViewModel>(),
        ),
      ],
      child: MyApp(token: token),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (_) => LocaleCubit(),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "flower_app",
              localizationsDelegates:
                  AppLocalizations.localizationsDelegates,
              supportedLocales:
                  AppLocalizations.supportedLocales,
              locale: locale,
              theme: AppTheme.lightTheme,
              onGenerateRoute: Routes.generateRoute,
              initialRoute:
                  (token != null && token!.isNotEmpty)
                  ? AppRoutes.homeScreen
                  : AppRoutes.loginScreen,
              routes: {
                AppRoutes.loginScreen: (context) =>
                    SignInView(),
                AppRoutes.signUpScreen: (context) =>
                    SignUpView(),
                AppRoutes.forgetPasswordScreen:
                    (context) => ForgetPasswordView(),
                AppRoutes.homeScreen: (context) =>
                    HomeScreen(),
                AppRoutes.bestSeller: (context) =>
                    BestSellerScreen(),
                AppRoutes.productDetailsScreen:
                    (context) => ProductDetailsScreen(),
              },
            );
          },
        ),
      ),
    );
  }
}
