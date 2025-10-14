// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_address_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingAddressModelDto _$ShippingAddressModelDtoFromJson(
  Map<String, dynamic> json,
) => ShippingAddressModelDto(
  street: json['street'] as String,
  phone: json['phone'] as String,
  city: json['city'] as String,
  lat: json['lat'] as String,
  long: json['long'] as String,
);

Map<String, dynamic> _$ShippingAddressModelDtoToJson(
  ShippingAddressModelDto instance,
) => <String, dynamic>{
  'street': instance.street,
  'phone': instance.phone,
  'city': instance.city,
  'lat': instance.lat,
  'long': instance.long,
};
