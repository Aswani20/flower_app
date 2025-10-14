import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/entities/address.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';

sealed class CheckoutEvent {
  const CheckoutEvent();
}

class PaymentCardEvent extends CheckoutEvent {
  ShippingAddressRequestEntity shippingAddressRequestEntity;
  PaymentCardEvent({required this.shippingAddressRequestEntity});
}

class PaymentCashEvent extends CheckoutEvent {
  ShippingAddressRequestEntity shippingAddressRequestEntity;
  PaymentCashEvent({required this.shippingAddressRequestEntity});
}

class PlaceOrder extends CheckoutEvent {}

class ToggleGift extends CheckoutEvent {
  final bool value;
  const ToggleGift(this.value);
}

class UpdateGiftStreet extends CheckoutEvent {
  final String street;
  const UpdateGiftStreet(this.street);
}

class UpdateGiftPhone extends CheckoutEvent {
  final String phone;
  const UpdateGiftPhone(this.phone);
}

class UpdateGiftCity extends CheckoutEvent {
  final String city;
  const UpdateGiftCity(this.city);
}

class SelectPaymentMethod extends CheckoutEvent {
  final PaymentMethod method;
  const SelectPaymentMethod(this.method);
}

class SelectAddress extends CheckoutEvent {
  final Address address;
  const SelectAddress(this.address);
}

class GetLoggedUserAddresses extends CheckoutEvent {}
