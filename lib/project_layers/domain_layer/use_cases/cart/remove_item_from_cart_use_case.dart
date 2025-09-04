import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveItemFromCartUseCase{
  final CartRepo cartRepo;
  RemoveItemFromCartUseCase(this.cartRepo);

  Future<CartResponseEntity> invoke(String itemId) async{
    final result = await cartRepo.removeItemFromCart(itemId);
    return result;
  }

}