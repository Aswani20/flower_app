import 'package:flower_app/project_layers/data_layer/data_source/cart_remote_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<CartResponseEntity> getCart() =>
      cartRemoteDataSource.getCart();

  @override
  Future<CartResponseEntity> updateCartItem(
    String itemId,
    int qty,
  ) => cartRemoteDataSource.updateCartItem(itemId, qty);

  @override
  Future<CartResponseEntity> addToCart(
    String productId, {
    int quantity = 1,
  }) => cartRemoteDataSource.addToCart(
    productId,
    quantity: quantity,
  );

  @override
  Future<CartResponseEntity> removeItemFromCart(
    String itemId,
  ) => cartRemoteDataSource.removeItemFromCart(itemId);

  @override
  Future<void> clearCart() =>
      cartRemoteDataSource.clearCart();
}
