// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_pay_responce_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashPayResponceModelDto _$CashPayResponceModelDtoFromJson(
  Map<String, dynamic> json,
) => CashPayResponceModelDto(
  message: json['message'] as String,
  orderDto: OrderPayModelDto.fromJson(json['order'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CashPayResponceModelDtoToJson(
  CashPayResponceModelDto instance,
) => <String, dynamic>{'message': instance.message, 'order': instance.orderDto};
