import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/entities/address.dart';

abstract interface class CheckoutRepo {
  Future<ApiResult<List<Address>>> getLoggedUserAddresses();
}
