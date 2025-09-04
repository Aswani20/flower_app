import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.17,
      width: context.width,
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: AppColors.grey,
        ),
      ),
      child: Row(
        spacing: 8,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Assets.images.noRoutes.image(
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                spacing: 4,
                children: [
                  Text(
                    "Red Roses",
                    style: AppStyles.medium16black,
                  ),
                  Text(
                    "15 Pink Rose Bouquet",
                    style: AppStyles.regular13grey,
                  ),
                  Spacer(),
                  Text(
                    '${context.l10n.egp} 100',
                    style: AppStyles.regular14black
                        .copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Assets.icons.deleteIcon.image(
                  color: AppColors.red,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove),
                  ),
                  Text(
                    '1',
                    style: AppStyles.medium16black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
