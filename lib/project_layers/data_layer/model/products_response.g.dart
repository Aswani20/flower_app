// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsResponse _$ProductsResponseFromJson(Map<String, dynamic> json) =>
    ProductsResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataDTO.fromJson(json['metadata'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsResponseToJson(ProductsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'products': instance.products,
    };

MetadataDTO _$MetadataDTOFromJson(Map<String, dynamic> json) => MetadataDTO(
  currentPage: (json['currentPage'] as num?)?.toInt(),
  totalPages: (json['totalPages'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalItems: (json['totalItems'] as num?)?.toInt(),
);

Map<String, dynamic> _$MetadataDTOToJson(MetadataDTO instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'limit': instance.limit,
      'totalItems': instance.totalItems,
    };

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
  id: json['_id'] as String?,
  rateAvg: (json['rateAvg'] as num?)?.toDouble(),
  rateCount: (json['rateCount'] as num?)?.toInt(),
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  imgCover: json['imgCover'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  price: (json['price'] as num?)?.toDouble(),
  priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toDouble(),
  quantity: (json['quantity'] as num?)?.toInt(),
  category: json['category'] as String?,
  occasion: json['occasion'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  isSuperAdmin: json['isSuperAdmin'] as bool?,
  sold: (json['sold'] as num?)?.toInt(),
  discount: (json['discount'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rateAvg': instance.rateAvg,
      'rateCount': instance.rateCount,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'isSuperAdmin': instance.isSuperAdmin,
      'sold': instance.sold,
      'discount': instance.discount,
    };
