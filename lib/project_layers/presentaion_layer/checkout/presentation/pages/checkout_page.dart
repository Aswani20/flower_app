import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/domain_layer/entities/user_cart.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/pages/widgets/gift_section.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/delivery_address_section.dart';
import 'widgets/payment_method_section.dart';
import 'widgets/order_summary_section.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.userCart});
  final UserCart userCart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CheckoutCubit>()..doIntent(GetLoggedUserAddresses()),
      child: _CheckoutView(userCart),
    );
  }
}

class _CheckoutView extends StatelessWidget {
  const _CheckoutView(this.userCart);
  final UserCart userCart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(context.l10n.checkout),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  context.l10n.delevery_time,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const Spacer(),
                Text(
                  context.l10n.schedule,
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: AppColors.pink),
                ),
              ],
            ),
          ),
          16.heightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Icon(Icons.access_time_rounded, color: AppColors.black),
                Text(
                  "Instant,",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "Arrive by 03 Sep 2024, 11:00 AM ",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: AppColors.green),
                ),
              ],
            ),
          ),
          24.heightBox,
          customDivider(),
          24.heightBox,
          const DeliveryAddressSection(),
          customDivider(),
          24.heightBox  ,
          const PaymentMethodSection(),
          24.heightBox,
          customDivider(),
          const GiftSection(),
          24.heightBox,
          customDivider(),
          24.heightBox,
          OrderSummarySection(userCart: userCart),
        ],
      ),
    );
  }

  Widget customDivider() {
    return Container(
      height: 24.h,
      color: AppColors.grey.withValues(alpha: 0.1),
    );
  }
}
