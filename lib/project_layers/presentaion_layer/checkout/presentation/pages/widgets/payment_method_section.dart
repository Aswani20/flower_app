import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/helpers/flutter_toast.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/page/webvieww_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'payment_method_card.dart';

class PaymentMethodSection extends StatelessWidget {
  const PaymentMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CheckoutCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.payment_method,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 16.h),
          BlocConsumer<CheckoutCubit, CheckoutState>(
            listener: (context, state) async {
              if (state.paymentCardEntity != null) {
                final url = state.paymentCardEntity!.checkoutUrl;
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => WebviewScreen(url: url)),
                );
                if (!context.mounted) return;
                if (result == true) {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.successPayment);
                } else {
                  ToastMessage.toastMsg(
                    context.l10n.payment_cancled,
                    backgroundColor: AppColors.red,
                    textColor: AppColors.white,
                  );
                }
              }

              if (state.errorMessage.isNotEmpty) {
                ToastMessage.toastMsg(
                  state.errorMessage.toString(),
                  backgroundColor: AppColors.red,
                  textColor: AppColors.white,
                );
              }

              //payment cash
              if (state.isOrderPlacedSuccess == true) {
                Navigator.of(context).pushReplacementNamed(AppRoutes.successPayment);
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                ?state.isGift ? null :  PaymentMethodCard(
                    title: context.l10n.cash_on_delivery,
                    isSelected:
                        state.selectedPaymentMethod ==
                        PaymentMethod.cashOnDelivery,
                    onSelect: () => cubit.doIntent(
                      const SelectPaymentMethod(PaymentMethod.cashOnDelivery),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  PaymentMethodCard(
                    title: context.l10n.credit_card,
                    isSelected:
                        state.selectedPaymentMethod == PaymentMethod.creditCard,
                    onSelect: () => cubit.doIntent(
                      const SelectPaymentMethod(PaymentMethod.creditCard),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
