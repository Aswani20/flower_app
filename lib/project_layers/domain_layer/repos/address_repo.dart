import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';

abstract class AddressRepo {
  Future<ApiResult<AddressResponseEntity>> addAddress(
    AddAddressRequestEntity addAddressRequestEntity,
  );

  Future<ApiResult<AddressResponseEntity>> getAddresses();
}
