import 'package:flower_app/project_layers/domain_layer/entities/category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_response.g.dart';

@JsonSerializable()
class CategoriesResponse {
  final String? message;
  final MetadataDTO? metadata;
  final List<CategoryDTO>? categories;

  CategoriesResponse({
    this.message,
    this.metadata,
    this.categories,
  });

  factory CategoriesResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$CategoriesResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CategoriesResponseToJson(this);
}

@JsonSerializable()
class MetadataDTO {
  final int? currentPage;
  final int? limit;
  final int? totalPages;
  final int? totalItems;

  MetadataDTO({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  factory MetadataDTO.fromJson(
    Map<String, dynamic> json,
  ) => _$MetadataDTOFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MetadataDTOToJson(this);
}

@JsonSerializable()
class CategoryDTO {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final bool? isSuperAdmin;
  final int? productsCount;

  CategoryDTO({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.productsCount,
  });

  factory CategoryDTO.fromJson(
    Map<String, dynamic> json,
  ) => _$CategoryDTOFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CategoryDTOToJson(this);

  CategoryEntity toCategoryEntity() => CategoryEntity(
    id: id,
    name: name,
    slug: slug,
    image: image,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isSuperAdmin: isSuperAdmin,
    productsCount: productsCount,
  );
}
