import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/domain_layer/entities/user_cart.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key, required this.userCart});
  final UserCart userCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.subtotal,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                "${context.l10n.egp} ${userCart.cart.totalPrice ?? 0}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          8.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.delivery_fee,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              Text(
                "${context.l10n.egp} 50",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          16.heightBox,
          const Divider(color: AppColors.grey, thickness: 1),
          8.heightBox,
          Row(
            children: [
              Text(
                context.l10n.total,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              Text(
                "${context.l10n.egp} ${(userCart.cart.totalPrice! + 50).toInt()}",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          24.heightBox,
          BlocBuilder<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              final isGift = state.isGift;

              final isGiftInfoValid =
                  !isGift ||
                  ((state.giftStreet?.trim().isNotEmpty ?? false) &&
                      (state.giftPhone?.trim().isNotEmpty ?? false) &&
                      (state.giftCity?.trim().isNotEmpty ?? false));

              final isCheckoutInfoValid =
                  state.selectedPaymentMethod != null &&
                  state.selectedAddress != null;

              final isButtonEnabled = isGift
                  ? isGiftInfoValid
                  : isCheckoutInfoValid;

              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () =>
                            context.read<CheckoutCubit>().doIntent(PlaceOrder())
                      : null,
                  child: state.isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(context.l10n.place_order),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
