
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';

sealed class CartStates{}
class CartInitialStates extends CartStates{}
class AddCartLoadingStates extends CartStates{}
class AddCartErrorStates extends CartStates{
  String message;
  AddCartErrorStates({required this.message});
}
class AddCartSuccessStates extends CartStates{
  CartResponseEntity cartData;
  AddCartSuccessStates({required this.cartData});

}

class GetCartLoadingStates extends CartStates{}
class GetCartErrorStates extends CartStates{
  String message;
  GetCartErrorStates({required this.message});
}
class GetCartSuccessStates extends CartStates{
  CartResponseEntity cartData;
  GetCartSuccessStates({required this.cartData});
}


class DeleteLoadingStates extends CartStates{}
class DeleteErrorStates extends CartStates{
  String message;
  DeleteErrorStates({required this.message});
}
class DeleteSuccessStates extends CartStates{
  CartResponseEntity cartData;
  DeleteSuccessStates({required this.cartData});
}
