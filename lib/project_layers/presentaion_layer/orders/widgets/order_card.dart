import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
      margin: EdgeInsets.only(
        top: 5.h,
        left: 10.w,
        right: 10.w,
      ),
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
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
                    CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10.h),
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
                  SizedBox(height: 10.h),
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
                    "Order Number${orderItem.orderNumber}",
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(
                          color: Colors.grey.shade600,
                        ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 0.5.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(24.r),
                      ),
                    ),
                    onPressed: () {
                      if (orderItem.state !=
                          "completed") {
                        // Navigate to map view with order ID
                        Navigator.pushNamed(
                          context,
                          AppRoutes.successView,
                          arguments: orderItem.id,
                        );
                      } else {
                        CartViewModel.get(
                          context,
                        ).addToCart(
                          orderItem
                              .orderItems![0]
                              .productEntity!
                              .id!,
                        );
                      }
                    },
                    child: Text(
                      orderItem.state != "completed"
                          ? "Track order"
                          : "Reorder",
                      style: TextStyle(
                        color: Colors.white,
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
