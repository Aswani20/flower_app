import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_cash_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCashUseCase {
  final PaymentRepo _paymentRepo;
  PaymentCashUseCase(this._paymentRepo);
  Future<ApiResult<PaymentCashEntity>> call(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) {
    return _paymentRepo.cashPaymentRepo(shippingAddressRequestEntity);
  }
}
