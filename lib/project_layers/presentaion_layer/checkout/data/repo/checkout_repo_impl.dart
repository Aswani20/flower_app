import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/data/sources/checkout_remote_ds.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/entities/address.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/repo/checkout_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  final CheckoutRemoteDS _checkoutRemoteDS;
  final InternetConnectionChecker _internetConnectionChecker;

  CheckoutRepoImpl(this._checkoutRemoteDS, this._internetConnectionChecker);

  @override
  Future<ApiResult<List<Address>>> getLoggedUserAddresses() async {
    final bool isConnected = await _internetConnectionChecker.hasConnection;
    if (!isConnected) {
      return ApiErrorResult(
       'No Internet Connection',
      );
    }

    try {
      final result = await _checkoutRemoteDS.getLoggedUserAddresses();
      return ApiSuccessResult(
         result.addresses!.map((e) => e.toEntity()).toList(),
      );
    } on DioException catch (e) {
      return ApiErrorResult(
       e.message ?? 'Something went wrong',
      );
    }
  }
}
