import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';

class OccasionResponseEntity {
  OccasionResponseEntity({this.message, this.metadata, this.occasions});
  String? message;
  MetadataEntity? metadata;
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
