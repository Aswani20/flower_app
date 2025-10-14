import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/data/model/get_user_addreses_respone/get_user_addreses_respone.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/data/sources/checkout_remote_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CheckoutRemoteDS)
class CheckoutRemoteDsImpl implements CheckoutRemoteDS {
  final ApiClient _apiServices;

  CheckoutRemoteDsImpl(this._apiServices);
  @override
  Future<GetUserAddresesRespone> getLoggedUserAddresses() async {
    return await _apiServices.getLoggedUserAddresses();
  }
}
