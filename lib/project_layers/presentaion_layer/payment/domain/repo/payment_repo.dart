import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_card_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_cash_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';

abstract class PaymentRepo {
  Future<ApiResult<PaymentCardEntity>> cardPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  );
  Future<ApiResult<PaymentCashEntity>> cashPaymentRepo(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  );
}
