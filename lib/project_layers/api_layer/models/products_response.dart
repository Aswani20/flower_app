import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final String? message;
  final MetadataDTO? metadata;
  final List<ProductDTO>? products;

  ProductsResponse({
    this.message,
    this.metadata,
    this.products,
  });

  factory ProductsResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductsResponseToJson(this);
}

@JsonSerializable()
class MetadataDTO {
  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  MetadataDTO({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  factory MetadataDTO.fromJson(
    Map<String, dynamic> json,
  ) => _$MetadataDTOFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MetadataDTOToJson(this);
}

@JsonSerializable()
class ProductDTO {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'rateAvg')
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

  ProductDTO({
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

  factory ProductDTO.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductDTOFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ProductDTOToJson(this);
  ProductEntity toProductEntity() => ProductEntity(
    
    id: id,
    rateAvg: rateAvg,
    rateCount: rateCount,
    title: title,
    slug: slug,
    description: description,
    imgCover: imgCover,
    images: images,
    price: price,
    priceAfterDiscount: priceAfterDiscount,
    quantity: quantity,
    category: category,
    occasion: occasion,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isSuperAdmin: isSuperAdmin,
    sold: sold,
    discount: discount,
  );
}
