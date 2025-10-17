import 'package:flower_app/core/dialog/dialog.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
 final  CartItemsEntity cartItemsEntity;

const  CartItem({super.key, required this.cartItemsEntity});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
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
            child: Image.network(
              widget.cartItemsEntity.product!.imgCover ??
                  Assets.images.noRoutes.path,
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
                   
                    
                    widget
                            .cartItemsEntity
                            .product!
                            .title ??
                        '',
                    style: AppStyles.medium16black,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                  ),
                  Text(
                    'Available Quantity ${widget.cartItemsEntity.product!.quantity}',
                    style: AppStyles.regular13grey,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 1,
                  ),
                  Spacer(),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '${context.l10n.egp} ${widget.cartItemsEntity.price}',
                      style: AppStyles.regular14black
                          .copyWith(
                            fontWeight: FontWeight.w600,
                          ),
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
                onPressed: () {
                  DialogUtils.showMessage(
                    context: context,
                    content:
                        "Are you sure to delete this item?",
                    posActions: "Yes",
                    negActions: "No",
                    posFunction: (ctx) {
                      Navigator.of(ctx).pop();
                      CartViewModel.get(ctx,).deleteItemFromCart(widget.cartItemsEntity.id,);
                    }

                  );
                },
                icon: Assets.icons.deleteIcon.image(
                  color: AppColors.red,
                  height: 22,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.remove, size: 15),
                  ),
                  Text(
                    '${widget.cartItemsEntity.quantity}',
                    style: AppStyles.medium16black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, size: 15),
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
