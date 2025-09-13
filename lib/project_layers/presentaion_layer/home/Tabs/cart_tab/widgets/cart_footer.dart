import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        8.heightBox,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.sub_total,
              style: AppStyles.regular16greyRoboto,
            ),
            Text(
              "100\$",
              style: AppStyles.regular16greyRoboto,
            ),
          ],
        ),
        8.heightBox,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.delivery_fee,
              style: AppStyles.regular16greyRoboto,
            ),
            Text(
              "10\$",
              style: AppStyles.regular16greyRoboto,
            ),
          ],
        ),
        16.heightBox,
        Divider(
          thickness: 2,
          color: AppColors.grey.withValues(alpha: 0.2),
        ),
        8.heightBox,
        Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.l10n.total,
              style: AppStyles.medium18blackRoboto,
            ),
            Text(
              "110\$",
              style: AppStyles.medium18blackRoboto,
            ),
          ],
        ),
        20.heightBox,
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          child: Text(
            context.l10n.checkout,
            style: AppStyles.medium16white,
          ),
        ),
      ],
    );
  }
}
