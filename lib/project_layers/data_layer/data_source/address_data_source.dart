import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';

import '../../../core/api_result/api_result.dart';

abstract class AddressDataSource {
  Future<ApiResult<AddressResponseEntity>> addAddress(
    AddAddressRequestEntity addAddressRequestEntity,
  );

  Future<ApiResult<AddressResponseEntity>> getAddresses();
}
