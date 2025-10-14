class OrderResponseEntity {
  final String? message;
  final Metadata? metadata;
  final List<OrdersEntity>? orders;

  OrderResponseEntity({
    this.message,
    this.metadata,
    this.orders,
  });
}

class Metadata {
  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  Metadata({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });
}

class OrdersEntity {
  final String? id;
  final String? user;
  final List<OrderItemsEntity>? orderItems;
  final int? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  final String? createdAt;
  final String? updatedAt;
  final String? orderNumber;

  OrdersEntity({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
  });
}

class OrderItemsEntity {
  final ProductEntity? productEntity;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItemsEntity({
    this.productEntity,
    this.price,
    this.quantity,
    this.id,
  });
}

class ProductEntity {
  final int? rateAvg;
  final int? rateCount;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final int? price;
  final int? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;
  final int? sold;
  final String? iid;

  ProductEntity({
    this.rateAvg,
    this.rateCount,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.sold,
    this.iid,
  });
}
