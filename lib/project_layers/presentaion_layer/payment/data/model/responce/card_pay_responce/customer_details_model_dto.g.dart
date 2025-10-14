// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_details_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDetailsModelDto _$CustomerDetailsModelDtoFromJson(
  Map<String, dynamic> json,
) => CustomerDetailsModelDto(
  email: json['email'] as String?,
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  taxExempt: json['tax_exempt'] as String?,
);

Map<String, dynamic> _$CustomerDetailsModelDtoToJson(
  CustomerDetailsModelDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'name': instance.name,
  'phone': instance.phone,
  'tax_exempt': instance.taxExempt,
};
