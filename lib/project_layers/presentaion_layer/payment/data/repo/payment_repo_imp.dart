import 'package:dio/dio.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/data_source/payment_ds.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/mapper/mapper_shipping_address_to_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_card_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_cash_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentRepo)
class PaymentRepoImp implements PaymentRepo {
  final PaymentDataSource _paymentDataSource;
  PaymentRepoImp(this._paymentDataSource);
  @override
  Future<ApiResult<PaymentCardEntity>> cardPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    try {
      var result = await _paymentDataSource.cardPayment(
        mapperToDto(shippingAddressRequestEntity),
      );
      return ApiSuccessResult( result.session.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
         e.message ?? "Server Failure",
      );
    } catch (e) {
      return ApiErrorResult(
        e.toString() ,
      );
    }
  }

  @override
  Future<ApiResult<PaymentCashEntity>> cashPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    try {
      var result = await _paymentDataSource.cashPayment(
        mapperToDto(shippingAddressRequestEntity),
      );
      return ApiSuccessResult( result.orderDto.toDomain());
    } on DioException catch (e) {
      return ApiErrorResult(
        e.message ?? "Server Failure",
      );
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
