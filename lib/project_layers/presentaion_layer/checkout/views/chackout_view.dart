import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/widgets/delivery_time_section.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/widgets/devery_adress_section.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/widgets/gift_section.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/widgets/payment_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChackoutView extends StatelessWidget {
  final int totalPrice;
  const ChackoutView({
    super.key,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing: 0,
        title: Text(
          "Checkout",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DeliveryTimeSection(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 30.h,
                  decoration: const BoxDecoration(
                    color: Color(0xffEAEAEA),
                  ),
                ),
                const SizedBox(height: 20),

                const DeliveryAddressSection(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xffEAEAEA),
                  ),
                ),
                const SizedBox(height: 20),

                const PaymentMethodSection(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xffEAEAEA),
                  ),
                ),
                const SizedBox(height: 20),

                const GiftInfoSection(),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xffEAEAEA),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Subtotal',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            '$totalPrice  EGP',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Delivery',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            '10 EGP',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),

                      const Divider(
                        color: AppColors.grey,
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${totalPrice + 10} EGP",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: CustomButton(
                    size: Size(double.infinity, 48.h),
                    borderRadius: 16,
                    child: const Text(
                      "Place Order",
                      style: TextStyle(
                        color: AppColors.white,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
