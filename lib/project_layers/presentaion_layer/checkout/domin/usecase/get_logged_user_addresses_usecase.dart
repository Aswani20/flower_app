import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/entities/address.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLoggedUserAddressesUsecase {
  CheckoutRepo checkoutRepo;

  GetLoggedUserAddressesUsecase(this.checkoutRepo);
  Future<ApiResult<List<Address>>> invok() =>
      checkoutRepo.getLoggedUserAddresses();
}
