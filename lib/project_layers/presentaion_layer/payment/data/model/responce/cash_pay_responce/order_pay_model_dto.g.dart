// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_pay_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPayModelDto _$OrderPayModelDtoFromJson(Map<String, dynamic> json) =>
    OrderPayModelDto(
      user: json['user'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      state: json['state'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      orderNumber: json['orderNumber'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderPayModelDtoToJson(OrderPayModelDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'orderItems': instance.orderItems?.map((e) => e.toJson()).toList(),
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'state': instance.state,
      '_id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'orderNumber': instance.orderNumber,
      '__v': instance.v,
    };
