import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateCartUseCase{
  final CartRepo cartRepo;
  UpdateCartUseCase(this.cartRepo);
  Future<CartResponseEntity> invoke(String itemId, int qty) async{
    final result = await cartRepo.updateCartItem(itemId, qty);
    return result;
  }
}