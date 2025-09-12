import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/data_layer/data_source/address_data_source.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressRepo)
class AddressRepoImpl implements AddressRepo {
  AddressDataSource addressDataSource;

  AddressRepoImpl(this.addressDataSource);

  @override
  Future<ApiResult<AddressResponseEntity>> addAddress(
    AddAddressRequestEntity addAddressRequestEntity,
  ) async {
    return await addressDataSource.addAddress(
      addAddressRequestEntity,
    );
  }

  @override
  Future<ApiResult<AddressResponseEntity>>
  getAddresses() async {
    return await addressDataSource.getAddresses();
  }
}
