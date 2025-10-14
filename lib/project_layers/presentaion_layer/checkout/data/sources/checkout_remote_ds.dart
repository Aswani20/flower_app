import 'package:flower_app/project_layers/presentaion_layer/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';

abstract interface class CheckoutRemoteDS {
  Future<GetUserAddresesRespone> getLoggedUserAddresses();
}
