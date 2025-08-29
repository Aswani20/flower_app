import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';

class CategoryResponseDto extends CategoryResponseEntity {
  CategoryResponseDto({super.message, super.metadata, super.categories});

  CategoryResponseDto.fromJson(dynamic json) {
    message = json['message'];
    metadata = json['metadata'] != null
        ? MetadataDto.fromJson(json['metadata'])
        : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(CategoryDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = (metadata as MetadataDto).toJson();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => (v as CategoryDto).toJson()).toList();
    }
    return map;
  }
}

class CategoryDto extends CategoryEntity {
  CategoryDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
    super.isSuperAdmin,
    super.productsCount,
  });

  CategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    isSuperAdmin = json['isSuperAdmin'];
    productsCount = json['productsCount'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['isSuperAdmin'] = isSuperAdmin;
    map['productsCount'] = productsCount;
    return map;
  }
}

class MetadataDto extends MetadataEntity {
  MetadataDto({super.currentPage, super.limit, super.totalPages, super.totalItems});

  MetadataDto.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    limit = json['limit'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['limit'] = limit;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    return map;
  }
}
