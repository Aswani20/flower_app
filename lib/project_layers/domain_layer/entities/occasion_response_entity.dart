class OccasionResponseEntity {
  OccasionResponseEntity({this.message, this.occasions});

  String? message;
  List<OccasionEntity>? occasions;
}

class OccasionEntity {
  OccasionEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.productsCount,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  bool? isSuperAdmin;
  int? productsCount;
}
