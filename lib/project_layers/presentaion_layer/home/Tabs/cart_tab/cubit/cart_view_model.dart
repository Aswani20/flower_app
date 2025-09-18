import 'package:bloc/bloc.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/add_to_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/clear_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/get_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/remove_item_from_cart_use_case.dart';
import 'package:flower_app/project_layers/domain_layer/use_cases/cart/update_cart_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_states.dart';

class CartViewModel extends Cubit<CartStates> {
  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  UpdateCartUseCase updateCartUseCase;
  RemoveItemFromCartUseCase removeItemFromCartUseCase;
  ClearCartUseCase clearCartUseCase;

  CartViewModel({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.updateCartUseCase,
    required this.removeItemFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(CartStates(isLoading: true)) {
    getCart();
  }

  Future<void> getCart() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final result = await getCartUseCase.invoke();
      emit(
        state.copyWith(
          cart: result.cart,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> addToCart(String productId, {int quantity = 1,}) async {
    try {
      emit(state.copyWith(isLoading: true));
      final data = await addToCartUseCase.invoke(productId, quantity: quantity,);
      emit(state.copyWith(cart: data.cart, isLoading: false),);
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> inc(String itemId) async => _step(itemId, 1);

  Future<void> dec(String itemId) async => _step(itemId, -1);

  Future<void> _step(String itemId, int delta) async {
    final current = state.cart;
    if (current == null || current.cartItems == null) return;

    final item = current.cartItems!.firstWhere((e) => e.id == itemId);
    final nextQty = (item.quantity! + delta).clamp(1, 999);

    final updatedItems = [
      for (final it in current.cartItems!)
        it.id == itemId ? it.copyWith(quantity: nextQty) : it,
    ];

    emit(state.copyWith(cart: current.copyWith(cartItems: updatedItems)));

    try {
      final data = await updateCartUseCase.invoke(itemId, nextQty);
      emit(state.copyWith(cart: data.cart));
    } catch (e) {
      emit(state.copyWith(cart: current, error: e.toString()));
    }
  }

  Future<void> remove(String itemId) async {
    final before = state.cart;
    if (before == null || before.cartItems == null) return;

    final optimistic = before.copyWith(
      cartItems: before.cartItems!.where((e) => e.id != itemId).toList(),
    );
    emit(state.copyWith(cart: optimistic));

    try {
      final data = await removeItemFromCartUseCase.invoke(itemId);
      emit(state.copyWith(cart: data.cart));
    } catch (e) {
      emit(state.copyWith(cart: before, error: e.toString()));
    }
  }

  Future<void> clearCart() async {
    final before = state.cart;
    emit(state.copyWith(isLoading: true));
    try {
      await clearCartUseCase.invoke();
      emit(state.copyWith(
        cart: before?.copyWith(cartItems: [], totalPrice: 0),
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
