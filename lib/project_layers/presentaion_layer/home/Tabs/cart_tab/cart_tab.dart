import 'package:flower_app/core/di/di.dart';
import 'package:flower_app/core/dialog/dialog.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/add_to_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/clear_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/get_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/remove_item_from_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/update_cart_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/card_header.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_deliver_to_address.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_footer.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cart_states.dart';


class CartTab extends StatelessWidget {
  CartTab({super.key});
  CartViewModel viewModel = CartViewModel(
    addToCartUseCase: getIt<AddToCartUseCase>(),
    clearCartUseCase: getIt<ClearCartUseCase>(),
    getCartUseCase: getIt<GetCartUseCase>(),
    removeItemFromCartUseCase: getIt<RemoveItemFromCartUseCase>(),
    updateCartUseCase: getIt<UpdateCartUseCase>(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartViewModel>(
      create: (context) => viewModel..getCart(),
      child: BlocConsumer<CartViewModel, CartStates>(
        builder: (context, state) {
          final items = state.cart?.cartItems ?? [];
          return SafeArea(
            child: Column(
              children: [
                CardHeader(
                  itemNumbers: state.cart?.cartItems?.length ?? 0,
                ),
                8.heightBox,
                CartDeliverToAddress(),
                24.heightBox,
                Expanded(
                  child: items.isEmpty ?const Center(child: Text('Your cart is empty')): ListView.builder(
                    itemBuilder: (context, index) {
                      return CartItem(
                        cartItemsEntity: items[index],
                      );
                    },
                    itemCount: items.length,
                  ),
                ),
                CartFooter(),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.isLoading && state.cart == null) {
            DialogUtils.showLoading(
              context: context,
              loadingMessage: context.l10n.loading,
            );
          }
          if (state.isLoading == false &&
              state.cart != null &&
              state.error == null) {
            DialogUtils.hideLoading(context);
          }
          if (state.isLoading == false &&
              state.error != null) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(
              context: context,
              title: context.l10n.error,
              content: state.error ?? context.l10n.error,
              negActions: context.l10n.ok,
            );
          }
        },
      ),
    );
  }
}
