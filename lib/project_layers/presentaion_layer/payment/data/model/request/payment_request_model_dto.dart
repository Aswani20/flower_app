import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/request/shipping_address_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_request_model_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentRequestModelDto {
  ShippingAddressModelDto shippingAddress;
  PaymentRequestModelDto({required this.shippingAddress});

  factory PaymentRequestModelDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentRequestModelDtoToJson(this);
}
