import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';
import 'package:flower_app/project_layers/domain_layer/repos/address_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAddressUseCase {
  AddressRepo addressRepo;
  GetAddressUseCase(this.addressRepo);

  Future<ApiResult<AddressResponseEntity>> invoke(
  ) async {
    return await addressRepo.getAddresses();
  }
}
