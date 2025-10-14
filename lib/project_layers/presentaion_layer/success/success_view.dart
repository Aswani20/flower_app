import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/presentaion_layer/success/cubit/success_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/success/cubit/success_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    var orderId =
        ModalRoute.of(context)!.settings.arguments
            as String? ??
        "68bf236aa8bca307f9e2f5a2";

    return BlocProvider(
      create: (context) =>
          SuccessViewModel()..checkOrderExists(orderId),
      child: _SuccessViewContent(orderId: orderId),
    );
  }
}

class _SuccessViewContent extends StatelessWidget {
  final String orderId;

  const _SuccessViewContent({required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
          padding: EdgeInsets.only(left: 15.0),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
            size: 25,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Track order',
          style: AppStyles.appBarTitleStyle,
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            SizedBox(height: 10),
            SvgPicture.asset(
              'assets/svg/success.svg',
              height: 150,
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Your Order Placed\nsuccessfully!',
                textAlign: TextAlign.center,
                style: AppStyles.medium18black.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),

            BlocBuilder<SuccessViewModel, SuccessStates>(
              builder: (context, state) {
                bool isOrderExists =
                    state is OrderExistsState;
                bool isLoading =
                    state is OrderCheckingState;

                return ElevatedButton(
                  onPressed: isOrderExists
                      ? () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.trackOrderView,
                            arguments: orderId,
                          );
                        }
                      : null, // Disabled when order doesn't exist
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isOrderExists
                        ? null
                        : Colors.grey.shade300,
                    disabledBackgroundColor:
                        Colors.grey.shade300,
                  ),
                  child: isLoading
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<
                                  Color
                                >(Colors.white),
                          ),
                        )
                      : Text(
                          isOrderExists
                              ? 'Track Order'
                              : 'waiting a driver acceptance',
                          style: AppStyles.medium16white
                              .copyWith(
                                color: isOrderExists
                                    ? Colors.white
                                    : Colors
                                          .grey
                                          .shade600,
                              ),
                        ),
                );
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
