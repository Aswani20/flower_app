import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryContactInfo extends StatelessWidget {
  final String deliveryPersonName;
  final String estimatedArrival;
  final bool showDetailsButton;
  final String phoneNo;
  const DeliveryContactInfo({
    super.key,
    required this.phoneNo,
    required this.deliveryPersonName,
    required this.estimatedArrival,
    this.showDetailsButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Estimated arrival section
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    'Estimated arrival',
                    style: AppStyles.regular14grey,
                  ),
                  Text(
                    estimatedArrival,
                    style: AppStyles.medium16black,
                  ),
                ],
              ),
            ),
          ],
        ),

        Divider(
          color: AppColors.grey.withValues(alpha: 0.3),
        ),
        const SizedBox(height: 10),

        // Delivery person info section
        Row(
          spacing: 6,
          children: [
            SvgPicture.asset(
              Assets.svg.deliveryBoy,
              width: 45,
              height: 45,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    deliveryPersonName,
                    style: AppStyles.medium16black,
                  ),
                  Text(
                    'is your delivery hero for today',
                    style: AppStyles.regular14grey
                        .copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            // Call and chat buttons
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Handle call
                    launchUrl(
                      Uri(
                        scheme: 'tel',
                        path: phoneNo,
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    Assets.svg.call,
                    width: 24,
                    height: 24,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // Handle chat
                    // Handle call
                    await launchUrl(
                      Uri.parse(
                        "https://api.whatsapp.com/send/?phone=2$phoneNo",
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    Assets.svg.whatsapp,
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ],
        ),

        if (showDetailsButton) const SizedBox(height: 20),

        // Order details button
        if (showDetailsButton)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Handle order details
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.pink,
                foregroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Order details',
                style: AppStyles.medium16white,
              ),
            ),
          ),
      ],
    );
  }
}
