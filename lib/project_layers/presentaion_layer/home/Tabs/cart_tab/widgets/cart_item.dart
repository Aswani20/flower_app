import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  CartItemsEntity cartItemsEntity;
  CartItem({super.key, required this.cartItemsEntity});

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
            child: Image.asset(cartItemsEntity.product!.imgCover ?? Assets.images.noRoutes.path),
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
                    cartItemsEntity.product!.title ?? '',
                    style: AppStyles.medium16black,
                  ),
                  Text(
                    'Available Quantity ${cartItemsEntity.product!.quantity}',
                    style: AppStyles.regular13grey,
                  ),
                  Spacer(),
                  Text(
                    '${context.l10n.egp} ${cartItemsEntity.price}',
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
