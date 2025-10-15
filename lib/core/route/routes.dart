import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/domain_layer/entities/user_cart.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/add_address/add_address.dart';
import 'package:flower_app/project_layers/presentaion_layer/addresses/saved_addresses/saved_addresses.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/forget_password/forget_password_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_in/login_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/auth/sign_up/sign_up_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/pages/checkout_page.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/views/about_us_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/views/edit_profile.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/views/reset_password.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/profile_tab/views/terms_and_conditions_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/home_screen.dart';
import 'package:flower_app/project_layers/presentaion_layer/map/view/map_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/notifications_list/cubit/notifications_list_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/notifications_list/views/notifications_list_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/success/cubit/success_view_model.dart';
import 'package:flower_app/project_layers/presentaion_layer/success/success_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/track_order/cubit/track_order_view_model.dart';
import 'package:flower_app/project_layers/presentaion_layer/track_order/view/track_order_view.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/page/success_screen.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/page/webvieww_screen.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/cubit/search_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/search/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../project_layers/presentaion_layer/home/Tabs/category_tab/views/category_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../project_layers/presentaion_layer/best_seller/best_seller_screen.dart';
import '../../project_layers/presentaion_layer/home/screens/product_details_screen.dart';
import '../../project_layers/presentaion_layer/orders/view/order_page.dart';
import '../../project_layers/presentation_layer/occasion/view/occasion_screen.dart';
import 'app_routes.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");
    switch (url.path) {
      case AppRoutes.occasionScreen:
        return MaterialPageRoute(
          builder: (_) => occasionScreen(),
        );
      case AppRoutes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordView(),
        );
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpView(),
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => SignInView(),
        );

      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (context) => EditProfile(),
          settings: settings,
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case AppRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => const ResetPassword(),
        );
      case AppRoutes.notificationsList:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<NotificationsListCubit>()
                  ..getNotifications(),
            child: NotificationsView(),
          ),
        );
      case AppRoutes.termsAndConditions:
        return MaterialPageRoute(
          builder: (context) =>
              const TermsAndConditionsView(),
        );
      case AppRoutes.chackoutView:
        final args = settings.arguments as UserCart;
        return MaterialPageRoute(
          builder: (_) => CheckoutPage(userCart: args),
        );
      case AppRoutes.aboutUs:
        return MaterialPageRoute(
          builder: (context) => AboutPage(),
        );
      case AppRoutes.searchView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchCubit>(),
            child: SearchScreen(),
          ),
        );
      case AppRoutes.bestSeller:
        return MaterialPageRoute(
          builder: (context) => BestSellerScreen(),
        );
      case AppRoutes.productDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsScreen(),
        );
      case AppRoutes.OrdersPage:
        return MaterialPageRoute(
          builder: (_) => OrdersPage(),
        );
      case AppRoutes.addAddress:
        return MaterialPageRoute(
          builder: (_) => AddAddressScreen(),
        );
      case AppRoutes.savedAddresses:
        return MaterialPageRoute(
          builder: (_) => SavedAddressesScreen(),
        );
      case AppRoutes.CategoryTab:
        return MaterialPageRoute(
          builder: (_) => categoryTab(),
        );
      case AppRoutes.trackOrderMap:
        return MaterialPageRoute(
          builder: (_) => TrackOrderMap(),
        );

      case AppRoutes.trackOrderView:
        return MaterialPageRoute(
          builder: (context) {
            var orderId = settings.arguments as String?;
            return BlocProvider(
              create: (context) =>
                  getIt<TrackOrderViewModel>()
                    ..loadOrderData(orderId!),
              child: TrackOrderView(),
            );
          },
        );

      case AppRoutes.successView:
        return MaterialPageRoute(
          builder: (context) {
            var orderId = settings.arguments as String;
            return BlocProvider(
              create: (context) =>
                  getIt<SuccessViewModel>()
                    ..checkOrderExists(orderId),
              child: SuccessView(orderId: orderId),
            );
          },
        );
      case AppRoutes.successPayment:
        return MaterialPageRoute(
          builder: (_) => const PaymentSuccessScreen(),
        );
      case AppRoutes.webView:
        final url = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => WebviewScreen(url: url),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundScreen(),
        );
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Assets.images.noRoutes.image(
                  width: context.width,
                  height: context.height,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        "404 Not Found ",
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5,
                  ),
                  child: Text(
                    "Oops! We couldn't find the page you're looking for.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: AppColors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                (context.height * 0.02).heightBox,
                SizedBox(
                  width: context.width * 0.6,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.loginScreen,
                      );
                    },
                    child: Text("Go to Home"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
