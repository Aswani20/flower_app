import 'package:flower_app/project_layers/domain_layer/use_cases/cart/add_to_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/get_cart_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain_layer/use_cases/cart/remove_item_from_cart_use_case.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  DeleteItemFromCartUseCase deleteItemFromCartUseCase;

  CartViewModel({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.deleteItemFromCartUseCase,
  }) : super(CartInitialStates());

  static CartViewModel get(context) =>
      BlocProvider.of<CartViewModel>(context);

  Future<void> addToCart(
    String productId, {
    int quantity = 1,
  }) async {
    try {
      emit(AddCartLoadingStates());
      final data = await addToCartUseCase.invoke(
        productId,
        quantity: quantity,
      );
      emit(AddCartSuccessStates(cartData: data));
    } catch (e) {
      emit(AddCartErrorStates(message: e.toString()));
    }
  }

  Future<void> getCart() async {
    try {
      emit(GetCartLoadingStates());
      final data = await getCartUseCase.invoke();
      emit(GetCartSuccessStates(cartData: data));
    } catch (e) {
      emit(GetCartErrorStates(message: e.toString()));
    }
  }

  Future<void> deleteItemFromCart(itemId) async {
    try {
      emit(DeleteLoadingStates());
      final data = await deleteItemFromCartUseCase.invoke(
        itemId,
      );
      emit(DeleteSuccessStates(cartData: data));
    } catch (e) {
      emit(DeleteErrorStates(message: e.toString()));
    }
  }
}
