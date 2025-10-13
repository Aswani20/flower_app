import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/presentaion_layer/track_order/cubit/track_order_states.dart';
import 'package:flutter/widgets.dart';

class OrderTimeLine extends StatelessWidget {
  const OrderTimeLine({super.key, required this.statuses});

  final List<OrderStatus> statuses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(statuses.length, (index) {
        final status = statuses[index];
        final isLast = index == statuses.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline indicator
            Column(
              children: [
                // Circle indicator
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: status.isCompleted
                        ? AppColors.pink
                        : AppColors.white,
                    border: Border.all(
                      color: status.isCompleted
                          ? AppColors.pink
                          : AppColors.grey,
                      width: status.isCompleted ? 3 : 2,
                    ),
                  ),
                  child: status.isCompleted
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pink,
                            border: Border.all(
                              color: AppColors.white,
                              width: 3.5,
                            ),
                          ),
                        )
                      : null,
                ),

                // Vertical line
                if (!isLast)
                  Container(
                    width: 1.75,
                    height: 60,
                    color: status.isCompleted
                        ? AppColors.pink.withValues(
                            alpha: 0.9,
                          )
                        : AppColors.grey.withValues(
                            alpha: 0.85,
                          ),
                    // margin: const EdgeInsets.symmetric(
                    //   vertical: 4,
                    // ),
                  ),
              ],
            ),

            const SizedBox(width: 16),

            // Status text
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    status.title,
                    style: status.isCompleted
                        ? AppStyles.medium16black
                        : AppStyles.regular16black
                              .copyWith(
                                color: AppColors.grey,
                              ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status.dateTime,
                    style: AppStyles.regular14grey,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
