import 'package:flower_app/project_layers/api_layer/models/response/order_response.dart';

import '../../domain_layer/entities/orders_entity.dart';

extension OrdersMapper on Orders {
  OrdersEntity toEntity() {
    return OrdersEntity(
      id: id,
      user: user,
      orderItems: orderItems
          ?.map((e) => e.toEntity())
          .toList(),
      totalPrice: totalPrice,
      paymentType: paymentType,
      isPaid: isPaid,
      isDelivered: isDelivered,
      state: state,
      createdAt: createdAt,
      updatedAt: updatedAt,
      orderNumber: orderNumber,
    );
  }
}

extension OrderItemsMapper on OrderItems {
  OrderItemsEntity toEntity() {
    return OrderItemsEntity(
      productEntity: product?.toEntity(),
      price: price,
      quantity: quantity,
      id: id,
    );
  }
}

extension ProductMapper on Product {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      description: description,
      imgCover: imgCover,
      images: images,
      price: price,
      priceAfterDiscount: priceAfterDiscount,
      quantity: quantity,
      category: category,
      occasion: occasion,
      sold: sold,
    );
  }
}
