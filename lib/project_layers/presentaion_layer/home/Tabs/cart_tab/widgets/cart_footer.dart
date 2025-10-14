import 'package:flower_app/core/extensions/navigator_extensions.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/user_cart.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart.dart';
import 'package:flutter/material.dart';

class CartFooter extends StatelessWidget {
  final CartResponseEntity cartData;

  const CartFooter({super.key, required this.cartData});

  UserCart _convertToUserCart() {
    return UserCart(
      message: cartData.message ?? '',
      numOfCartItems: cartData.numOfCartItems ?? 0,
      cart: Cart(
        id: cartData.cart?.id,
        user: cartData.cart?.user,
        totalPrice: cartData.cart?.totalPrice,
        cartItems: [],
        appliedCoupons: cartData.cart?.appliedCoupons,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int totalPrice = cartData.cart?.totalPrice ?? 0;

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
              "$totalPrice EGP",
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
              "10 EGP",
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
              "${totalPrice + 10} EGP",
              style: AppStyles.medium18blackRoboto,
            ),
          ],
        ),
        20.heightBox,
        ElevatedButton(
          onPressed: () {
            context.pushNamed(
              AppRoutes.chackoutView,
              arguments: _convertToUserCart(),
            );
          },
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
