import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/l10n/app_localizations.dart';
import '../../../../core/route/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../domain_layer/entities/orders_entity.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.orderItem});

  final OrdersEntity orderItem;

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 109.h,
              width: 127.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(
                    orderItem
                        .orderItems![0]
                        .productEntity!
                        .imgCover!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  Text(
                    orderItem
                        .orderItems![0]
                        .productEntity!
                        .title!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${trans.egp}: ${orderItem.totalPrice}',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w600,
                        ),
                  ),

                  Text(
                    orderItem.state == "completed"
                        ? '${"delivered_on"} ${orderItem.updatedAt}'
                        : '${"order_number"}:${orderItem.orderNumber!}',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  SizedBox(height: 8.h),
                  SizedBox(
                    width: double.infinity,
                    height: 30.h,
                    child: ElevatedButton(
                      onPressed: () {
                        if (orderItem.state ==
                            "pending") {
                          // Navigate to map view with order ID
                          Navigator.pushNamed(
                            context,
                            AppRoutes.trackOrderMap,
                            arguments: orderItem.id,
                          );
                        } 
                      },
                      child: Text(
                        orderItem.state == "pending"
                            ? "track_order"
                            : "reorder",
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
