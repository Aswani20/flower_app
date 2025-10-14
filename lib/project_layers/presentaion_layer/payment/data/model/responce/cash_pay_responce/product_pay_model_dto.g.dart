// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_pay_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductPayModelDto _$ProductPayModelDtoFromJson(Map<String, dynamic> json) =>
    ProductPayModelDto(
      id: json['_id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      imgCover: json['imgCover'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: json['price'] as num,
      priceAfterDiscount: json['priceAfterDiscount'] as num,
      discount: json['discount'] as num? ?? 0,
      rateAvg: json['rateAvg'] as num,
      rateCount: (json['rateCount'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      category: json['category'] as String,
      occasion: json['occasion'] as String,
      isSuperAdmin: json['isSuperAdmin'] as bool,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProductPayModelDtoToJson(ProductPayModelDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'discount': instance.discount,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'isSuperAdmin': instance.isSuperAdmin,
      'sold': instance.sold,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
