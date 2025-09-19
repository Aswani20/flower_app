import 'package:flower_app/project_layers/api_layer/models/products_response.dart';
import 'package:flower_app/project_layers/domain_layer/entities/cart_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cart_response_dto.g.dart';

@JsonSerializable()
class CartResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "numOfCartItems")
  final int? numOfCartItems;
  @JsonKey(name: "cart")
  final CartDto? cart;

  CartResponseDto ({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  factory CartResponseDto.fromJson(Map<String, dynamic> json) {
    return _$CartResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartResponseDtoToJson(this);
  }

  CartResponseEntity toEntity(){
    return CartResponseEntity(
      message:message,
      numOfCartItems: numOfCartItems,
      cart: cart?.toEntity(),
    );
  }
}

@JsonSerializable()
class CartDto {
  @JsonKey(name: "_id")
  final String? id;
  @JsonKey(name: "user")
  final String? user;
  @JsonKey(name: "cartItems")
  final List<CartItemsDto>? cartItems;
  @JsonKey(name: "appliedCoupons")
  final List<dynamic>? appliedCoupons;
  @JsonKey(name: "totalPrice")
  final int? totalPrice;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;

  CartDto ({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory CartDto.fromJson(Map<String, dynamic> json) {
    return _$CartDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartDtoToJson(this);
  }

  CartEntity toEntity(){
    return CartEntity(
      id: id,
      user: user,
      cartItems: cartItems?.map((item) => item.toCartItemEntity()).toList(),
      appliedCoupons: appliedCoupons,
      totalPrice: totalPrice,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

}

@JsonSerializable()
class CartItemsDto {
  @JsonKey(name: "product")
  final ProductDTO? product;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "_id")
  final String? id;

  CartItemsDto ({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  factory CartItemsDto.fromJson(Map<String, dynamic> json) {
    return _$CartItemsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CartItemsDtoToJson(this);
  }


  CartItemsEntity toCartItemEntity(){
    return CartItemsEntity(
      product: product?.toProductEntity(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}




