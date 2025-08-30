import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';

import 'best_seller_response.dart';

class BestSellerMapper {
  static BestSellerResponseEntity toEntity(BestSellerResponse response) {
    return BestSellerResponseEntity(
      message: response.message,
      bestSeller: response.bestSeller?.map((item) => BestSellerEntity(
        rateCount: item.rateCount,
        id: item.id,
        title: item.title,
        slug: item.slug,
        description: item.description,
        imgCover: item.imgCover,
        images: item.images,
        quantity: item.quantity,
        category: item.category,
        occasion: item.occasion,
        createdAt: item.createdAt,
        updatedAt: item.updatedAt,
        isSuperAdmin: item.isSuperAdmin,
        sold: item.sold,
      )).toList(),
    );
  }
}