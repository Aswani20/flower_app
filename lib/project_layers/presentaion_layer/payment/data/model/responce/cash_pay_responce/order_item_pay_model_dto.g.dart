// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_pay_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) => OrderItemDto(
  productDto: ProductPayModelDto.fromJson(
    json['product'] as Map<String, dynamic>,
  ),
  price: (json['price'] as num).toDouble(),
  quantity: (json['quantity'] as num).toInt(),
  id: json['_id'] as String?,
);

Map<String, dynamic> _$OrderItemDtoToJson(OrderItemDto instance) =>
    <String, dynamic>{
      'product': instance.productDto.toJson(),
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
