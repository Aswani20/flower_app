import 'package:flower_app/project_layers/domain_layer/entities/best_seller_response_entity.dart';

class BestSellerResponseDto extends BestSellerResponseEntity {
  BestSellerResponseDto({super.message, super.bestSeller});

  BestSellerResponseDto.fromJson(dynamic json) {
    message = json['message'];
    if (json['bestSeller'] != null) {
      bestSeller = [];
      json['bestSeller'].forEach((v) {
        bestSeller?.add(BestSellerDto.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (bestSeller != null) {
      map['bestSeller'] = bestSeller
          ?.map((v) => (v as BestSellerDto).toJson())
          .toList();
    }
    return map;
  }
}

class BestSellerDto extends BestSellerEntity {
  BestSellerDto({
    super.rateAvg,
    super.rateCount,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.imgCover,
    super.images,
    super.price,
    super.priceAfterDiscount,
    super.quantity,
    super.category,
    super.occasion,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.isSuperAdmin,
    super.sold,
  });

  BestSellerDto.fromJson(dynamic json) {
    rateAvg = json['rateAvg']?.toDouble();
    rateCount = json['rateCount']?.toInt();
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    price = json['price']?.toDouble();
    priceAfterDiscount = json['priceAfterDiscount']?.toDouble();
    quantity = json['quantity']?.toInt();
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v']?.toInt();
    isSuperAdmin = json['isSuperAdmin'];
    sold = json['sold']?.toInt();
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rateAvg'] = rateAvg;
    map['rateCount'] = rateCount;
    map['_id'] = id;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['imgCover'] = imgCover;
    map['images'] = images;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['quantity'] = quantity;
    map['category'] = category;
    map['occasion'] = occasion;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['isSuperAdmin'] = isSuperAdmin;
    map['sold'] = sold;
    map['id'] = id;
    return map;
  }
}
