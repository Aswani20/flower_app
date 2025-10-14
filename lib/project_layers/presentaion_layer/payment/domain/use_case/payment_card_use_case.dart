import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_card_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/repo/payment_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCardUseCase {
  final PaymentRepo _paymentRepo;
  PaymentCardUseCase(this._paymentRepo);
  Future<ApiResult<PaymentCardEntity>> call(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) {
    return _paymentRepo.cardPaymentRepo(shippingAddressRequestEntity);
  }
}
