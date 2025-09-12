class ProductEntity {
  final String? id;
  final double? rateAvg;
  final int? rateCount;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final double? price;
  final double? priceAfterDiscount;
  final int? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;
  final int? sold;
  final int? discount;

  ProductEntity({
    this.id,
    this.rateAvg,
    this.rateCount,
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
    this.discount,
  });
}

