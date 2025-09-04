import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';

abstract class CartRepo{
  Future<CartResponseEntity> getCart();
  Future<CartResponseEntity> addToCart(String productId, {int quantity = 1});
  Future<CartResponseEntity> updateCartItem(String itemId, int qty);
  Future<CartResponseEntity> removeItemFromCart(String itemId);
  Future<void> clearCart();
}



