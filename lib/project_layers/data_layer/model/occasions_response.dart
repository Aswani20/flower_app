import 'package:json_annotation/json_annotation.dart';

import '../../domain_layer/entities/occasion_response_entity.dart';

part 'occasions_response.g.dart';

@JsonSerializable()
class OccasionsResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final Metadata? metadata;
  @JsonKey(name: "occasions")
  final List<Occasions>? occasions;

  OccasionsResponse ({
    this.message,
    this.metadata,
    this.occasions,
  });

  factory OccasionsResponse.fromJson(Map<String, dynamic> json) {
    return _$OccasionsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsResponseToJson(this);
  }
}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "totalPages")
  final int? totalPages;
  @JsonKey(name: "totalItems")
  final int? totalItems;

  Metadata ({
    this.currentPage,
    this.limit,
    this.totalPages,
    this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetadataToJson(this);
  }
}

@JsonSerializable()
class Occasions {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "createdAt")
  final String? createdAt;
  @JsonKey(name: "updatedAt")
  final String? updatedAt;
  @JsonKey(name: "isSuperAdmin")
  final bool? isSuperAdmin;
  @JsonKey(name: "productsCount")
  final int? productsCount;

  Occasions ({
    this.Id,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.isSuperAdmin,
    this.productsCount,
  });

  factory Occasions.fromJson(Map<String, dynamic> json) {
    return _$OccasionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OccasionsToJson(this);
  }

  OccasionEntity toCategoryEntity() => OccasionEntity(
    id: Id,
    name: name,
    slug: slug,
    image: image,
    createdAt: createdAt,
    updatedAt: updatedAt,
    isSuperAdmin: isSuperAdmin,
    productsCount: productsCount,
  );
}


