import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';

class CartStates {
  final CartEntity? cart;
  final bool isLoading;
  final String? error;

  CartStates({
    this.cart,
    this.isLoading = false,
    this.error,
  });

  CartStates copyWith({
    CartEntity? cart,
    bool? isLoading,
    String? error,
  }) => CartStates(
    cart: cart ?? this.cart,
    isLoading: isLoading ?? this.isLoading,
    error: error ?? this.error,
  );
}
