class CategoryResponseEntity {
  CategoryResponseEntity({this.message, this.metadata, this.categories});
  String? message;
  MetadataEntity? metadata;
  List<CategoryEntity>? categories;
}

class CategoryEntity {
  CategoryEntity({
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

class MetadataEntity {
  MetadataEntity({this.currentPage, this.limit, this.totalPages, this.totalItems});
  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;
}
