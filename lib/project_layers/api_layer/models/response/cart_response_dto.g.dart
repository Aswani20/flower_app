// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponseDto _$CartResponseDtoFromJson(Map<String, dynamic> json) =>
    CartResponseDto(
      message: json['message'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cart: json['cart'] == null
          ? null
          : CartDto.fromJson(json['cart'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseDtoToJson(CartResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cart': instance.cart,
    };

CartDto _$CartDtoFromJson(Map<String, dynamic> json) => CartDto(
  id: json['_id'] as String?,
  user: json['user'] as String?,
  cartItems: (json['cartItems'] as List<dynamic>?)
      ?.map((e) => CartItemsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  appliedCoupons: json['appliedCoupons'] as List<dynamic>?,
  totalPrice: (json['totalPrice'] as num?)?.toInt(),
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$CartDtoToJson(CartDto instance) => <String, dynamic>{
  '_id': instance.id,
  'user': instance.user,
  'cartItems': instance.cartItems,
  'appliedCoupons': instance.appliedCoupons,
  'totalPrice': instance.totalPrice,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};

CartItemsDto _$CartItemsDtoFromJson(Map<String, dynamic> json) => CartItemsDto(
  product: json['product'] == null
      ? null
      : ProductDTO.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
  id: json['_id'] as String?,
);

Map<String, dynamic> _$CartItemsDtoToJson(CartItemsDto instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.id,
    };
