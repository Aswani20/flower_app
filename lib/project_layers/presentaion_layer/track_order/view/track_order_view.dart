import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/utils/widgets/delivery_contact_info.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/presentaion_layer/track_order/view/widgets/order_time_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import '../cubit/track_order_view_model.dart';
import '../cubit/track_order_states.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
                size: 25,
              ),
            ),

            Text(
              'Track order',
              style: AppStyles.appBarTitleStyle,
            ),
          ],
        ),
        centerTitle: false,
      ),
      body:
          BlocBuilder<
            TrackOrderViewModel,
            TrackOrderStates
          >(
            builder: (context, state) {
              if (state is TrackOrderLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.pink,
                  ),
                );
              } else if (state is TrackOrderLoadedState) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      // Estimated arrival section
                      DeliveryContactInfo(
                        deliveryPersonName:
                            '${state.order.driver?.firstName} ${state.order.driver?.lastName}',
                        estimatedArrival:
                            "03 Sep 2024, 11:00 AM",
                        phoneNo:
                            state.order.driver?.phone ??
                            '',
                      ),

                      const SizedBox(height: 35),
                      // Car illustration
                      Center(
                        child: Image.asset(
                          Assets.images.deliveryCar.path,
                          height: 100,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Order status timeline
                      OrderTimeLine(
                        statuses: state.orderStatuses,
                      ),

                      const SizedBox(height: 15),

                      // Show map button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.trackOrderMap,
                            arguments: context
                                .read<
                                  TrackOrderViewModel
                                >()
                                .orderId,
                          );
                        },
                        child: Text(
                          'Show map',
                          style: AppStyles.medium16white,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is TrackOrderErrorState) {
                return Center(
                  child: Text(
                    state.error,
                    style: AppStyles.medium16black,
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
    );
  }
}
