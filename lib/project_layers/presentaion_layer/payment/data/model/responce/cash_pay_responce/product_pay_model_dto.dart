import 'package:json_annotation/json_annotation.dart';
part 'product_pay_model_dto.g.dart';

@JsonSerializable()
class ProductPayModelDto {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final String slug;
  final String description;
  final String imgCover;
  final List<String> images;
  final num price;
  final num priceAfterDiscount;
  @JsonKey(defaultValue: 0)
  final num discount;
  final num rateAvg;
  final int rateCount;
  final int quantity;
  final String category;
  final String occasion;
  final bool isSuperAdmin;
  @JsonKey(defaultValue: 0)
  final int sold;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductPayModelDto({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.imgCover,
    required this.images,
    required this.price,
    required this.priceAfterDiscount,
    required this.discount,
    required this.rateAvg,
    required this.rateCount,
    required this.quantity,
    required this.category,
    required this.occasion,
    required this.isSuperAdmin,
    required this.sold,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductPayModelDto.fromJson(Map<String, dynamic> json) =>
      _$ProductPayModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductPayModelDtoToJson(this);
}
