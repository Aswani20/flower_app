import 'package:flower_app/project_layers/domain_layer/repos/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ClearCartUseCase{
  final CartRepo cartRepo;
  ClearCartUseCase(this.cartRepo);

  Future<void> invoke() async{
    final result = await cartRepo.clearCart();
    return result;
  }
}