import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';

sealed class PaymentEvent {}

class PaymentCardEvent extends PaymentEvent {
  ShippingAddressRequestEntity shippingAddressRequestEntity;
  PaymentCardEvent({required this.shippingAddressRequestEntity});
}

class PaymentCashEvent extends PaymentEvent {
  ShippingAddressRequestEntity shippingAddressRequestEntity;
  PaymentCashEvent({required this.shippingAddressRequestEntity});
}

class ClearErorrMessageEvent extends PaymentEvent {}
