import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/helpers/flutter_toast.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/page/webvieww_screen.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/view_model/payment_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/view_model/payment_event.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/view_model/payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PaymentCubit>(),
      child: Scaffold(
        body: BlocListener<PaymentCubit, PaymentState>(
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
              context.read<PaymentCubit>().doIntent(ClearErorrMessageEvent());
            }

            //payment cash
            if (state.isSuccessCash == true) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.successPayment);
            }
          },
          child: BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              if (state.isLoadding) {
                return const Center(child: CircularProgressIndicator());
              }

              return const Padding(
                padding: EdgeInsets.all(20),
                child: Column(),
              );
            },
          ),
        ),
      ),
    );
  }
}
