import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/request/shipping_address_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';

PaymentRequestModelDto mapperToDto(
  ShippingAddressRequestEntity shippingAddressRequestEntity,
) {
  return PaymentRequestModelDto(
    shippingAddress: ShippingAddressModelDto(
      street: shippingAddressRequestEntity.street,
      phone: shippingAddressRequestEntity.phone,
      city: shippingAddressRequestEntity.city,
      lat: shippingAddressRequestEntity.lat,
      long: shippingAddressRequestEntity.long,
    ),
  );
}
