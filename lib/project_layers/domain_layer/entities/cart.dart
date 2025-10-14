import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_item.dart';

class Cart {
  String? id;
  String? user;
  List<CartItem>? cartItems;
  List<dynamic>? appliedCoupons;
  int? totalPrice;

  Cart({
    this.id,
    this.user,
    this.cartItems,
    this.appliedCoupons,
    this.totalPrice,
  });

  Cart copyWith({
    String? id,
    String? user,
    List<CartItem>? cartItems,
    List<dynamic>? appliedCoupons,
    int? totalPrice,
  }) {
    return Cart(
      id: id ?? this.id,
      user: user ?? this.user,
      cartItems: cartItems ?? this.cartItems,
      appliedCoupons: appliedCoupons ?? this.appliedCoupons,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
