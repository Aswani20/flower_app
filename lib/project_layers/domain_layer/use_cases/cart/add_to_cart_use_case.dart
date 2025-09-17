import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase{
  final CartRepo _cartRepo;
  AddToCartUseCase(this._cartRepo);

  Future<CartResponseEntity> invoke(String productId, {int quantity = 1}) async{
    final result = await _cartRepo.addToCart(productId, quantity: quantity);
    return result;
  }

}