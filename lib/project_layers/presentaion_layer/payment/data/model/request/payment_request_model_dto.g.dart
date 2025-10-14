// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequestModelDto _$PaymentRequestModelDtoFromJson(
  Map<String, dynamic> json,
) => PaymentRequestModelDto(
  shippingAddress: ShippingAddressModelDto.fromJson(
    json['shippingAddress'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PaymentRequestModelDtoToJson(
  PaymentRequestModelDto instance,
) => <String, dynamic>{'shippingAddress': instance.shippingAddress.toJson()};
