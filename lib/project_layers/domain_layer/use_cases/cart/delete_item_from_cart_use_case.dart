import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteItemFromCartUseCase{
  final CartRepo _cartRepo;
  DeleteItemFromCartUseCase(this._cartRepo);

  Future<CartResponseEntity> invoke(itemId) async{
     return await _cartRepo.deleteItemFromCart(itemId);
  }

}