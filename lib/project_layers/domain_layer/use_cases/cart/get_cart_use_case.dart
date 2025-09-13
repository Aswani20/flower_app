import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCartUseCase{
  CartRepo cartRepo;
  GetCartUseCase(this.cartRepo);

  Future<CartResponseEntity> invoke() async {
    final result = await cartRepo.getCart();
    return result;
  }
}