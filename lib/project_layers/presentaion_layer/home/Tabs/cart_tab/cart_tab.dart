import 'package:flower_app/core/dialog/dialog.dart';
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
import 'package:fluttertoast/fluttertoast.dart';

class CartTab extends StatefulWidget {
  CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  @override
  void initState() {
    CartViewModel.get(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartViewModel, CartStates>(
      listener: (context, state) {
        if (state is DeleteSuccessStates) {
          Fluttertoast.showToast(msg: "Item deleted successfully", backgroundColor: AppColors.green);
        }else if (state is DeleteLoadingStates) {
          Fluttertoast.showToast(msg: "Loading...", backgroundColor: AppColors.grey);
        }
        else if (state is DeleteErrorStates) {
          Fluttertoast.showToast(msg: "Error: ${state.message}", backgroundColor: AppColors.red);
        }
      },
      builder: (context, state) {
        if (state is GetCartErrorStates) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.message),
                16.heightBox,
                ElevatedButton(
                  onPressed: () {
                    CartViewModel.get(context).getCart();
                  },
                  child: Text("Retry"),
                ),
              ],
            ),
          );
        }
        else if (state is GetCartSuccessStates || state is DeleteSuccessStates) {
          final cartData = state is GetCartSuccessStates
              ? state.cartData
              : (state as DeleteSuccessStates).cartData;
          if (cartData.cart?.cartItems?.isEmpty ?? true) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 100,
                    color: AppColors.grey,
                  ),
                  16.heightBox,
                  Text(
                    "Your cart is empty",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
          return SafeArea(
            child: Column(
              children: [
                CardHeader(
                  itemNumbers: cartData.numOfCartItems ?? 0,
                ),
                8.heightBox,
                CartDeliverToAddress(),
                24.heightBox,
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItem(
                        cartItemsEntity: cartData.cart!.cartItems![index],
                      );
                    },
                    itemCount: cartData.cart!.cartItems!.length,
                  ),
                ),
                CartFooter(
                  totalPrice: cartData.cart!.totalPrice ?? 0,
                ),
              ],
            ),
          );
        }
        else if (state is DeleteLoadingStates) {
          return Stack(
            children: [
              _buildCartContent(context),
              Container(
                color: AppColors.pink[20],
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.pink,
                  ),
                ),
              ),
            ],
          );
        }
        else {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.pink,
            ),
          );
        }
      },
    );
  }

  Widget _buildCartContent(BuildContext context) {
    return Center(
      child: Text("Loading..."),
    );
  }
}