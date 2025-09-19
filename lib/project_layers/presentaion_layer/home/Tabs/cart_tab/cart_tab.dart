import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/card_header.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_deliver_to_address.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_footer.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/di.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartStates>(
      builder: (context, state) {
        if (state is GetCartErrorStates) {
          return Center(
            child: Column(
              children: [
                Text(state.message),
                ElevatedButton(
                  onPressed: () {
                    CartViewModel.get(context).getCart();
                  },
                  child: Text("Retry"),
                ),
              ],
            ),
          );
        } else if (state is GetCartSuccessStates) {
          return SafeArea(
            child: Column(
              children: [
                CardHeader(
                  itemNumbers:
                      state.cartData.numOfCartItems!,
                ),
                8.heightBox,
                CartDeliverToAddress(),
                24.heightBox,
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItem(
                        cartItemsEntity: state
                            .cartData
                            .cart!
                            .cartItems![index],
                      );
                    },
                    itemCount: state
                        .cartData
                        .cart!
                        .cartItems!
                        .length,
                  ),
                ),
                CartFooter(
                  totalPrice:
                      state.cartData.cart!.totalPrice!,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.pink,
            ),
          );
        }
      },
    );
  }
}
