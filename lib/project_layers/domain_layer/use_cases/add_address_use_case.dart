import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/entities/request/add_address_request_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddAddressUseCase {
  AddressRepo addressRepo;
  AddAddressUseCase(this.addressRepo);

  Future<ApiResult<AddressResponseEntity>> invoke(
    AddAddressRequestEntity addAddressRequestEntity,
  ) async {
    return await addressRepo.addAddress(
      addAddressRequestEntity,
    );
  }
}
