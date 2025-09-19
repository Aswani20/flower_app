import 'package:flower_app/project_layers/api_layer/models/response/category_response_dto.dart';
import 'package:flower_app/project_layers/domain_layer/entities/occasion_response_entity.dart';

class OccasionResponseDto extends OccasionResponseEntity {
  OccasionResponseDto({super.message, super.occasions});

  OccasionResponseDto.fromJson(dynamic json) {
    message = json['message'];

    if (json['occasions'] != null) {
      occasions = [];
      json['occasions'].forEach((v) {
        occasions?.add(OccasionDto.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;

    if (occasions != null) {
      map['occasions'] = occasions
          ?.map((v) => (v as OccasionDto).toJson())
          .toList();
    }
    return map;
  }
}

class OccasionDto extends OccasionEntity {
  OccasionDto({
    super.id,
    super.name,
    super.slug,
    super.image,
    super.createdAt,
    super.updatedAt,
    super.isSuperAdmin,
    super.productsCount,
  });

  OccasionDto.fromJson(dynamic json) {
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