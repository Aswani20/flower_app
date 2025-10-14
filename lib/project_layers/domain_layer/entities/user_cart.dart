
import 'package:flower_app/project_layers/domain_layer/entities/cart.dart';

class UserCart {
  final String message;
  final int numOfCartItems;
  final Cart cart;

  UserCart({
    required this.message,
    required this.numOfCartItems,
    required this.cart,
  });

  UserCart copyWith({String? message, int? numOfCartItems, Cart? cart}) {
    return UserCart(
      message: message ?? this.message,
      numOfCartItems: numOfCartItems ?? this.numOfCartItems,
      cart: cart ?? this.cart,
    );
  }
}
