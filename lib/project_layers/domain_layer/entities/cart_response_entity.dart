import 'product_entity.dart';
class CartResponseEntity {
  final String? message;
  final int? numOfCartItems;
  final CartEntity? cart;

  CartResponseEntity({
    this.message,
    this.numOfCartItems,
    this.cart,
  });

  CartResponseEntity copyWith({
    String? message,
    int? numOfCartItems,
    CartEntity? cart,
  }) {
    return CartResponseEntity(
      message: message ?? this.message,
      numOfCartItems: numOfCartItems ?? this.numOfCartItems,
      cart: cart ?? this.cart,
    );
  }
}

class CartEntity {
  final String? id;
  final String? user;
  final List<CartItemsEntity>? cartItems;
  final List<dynamic>? appliedCoupons;
  final int? totalPrice;
  final String? createdAt;
  final String? updatedAt;


  CartEntity({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,

  });

  CartEntity copyWith({
    String? id,
    String? user,
    List<CartItemsEntity>? cartItems,
    List<String>? appliedCoupons,
    int? totalPrice,
    String? createdAt,
    String? updatedAt,
  }) {
    return CartEntity(
      id: id ?? this.id,
      user: user ?? this.user,
      cartItems: cartItems ?? this.cartItems,
      appliedCoupons: appliedCoupons ?? this.appliedCoupons,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}


class CartItemsEntity {
  final ProductEntity? product;
  final int? price;
  final int? quantity;
  final String? id;

  CartItemsEntity({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  CartItemsEntity copyWith({
    ProductEntity? product,
    int? price,
    int? quantity,
    String? id,
  }) {
    return CartItemsEntity(
      product: product ?? this.product,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      id: id ?? this.id,
    );
  }
}
