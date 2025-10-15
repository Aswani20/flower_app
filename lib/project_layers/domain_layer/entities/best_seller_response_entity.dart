class BestSellerResponseEntity {
  BestSellerResponseEntity({this.message, this.bestSeller});
  String? message;
  List<BestSellerEntity>? bestSeller;
}

class BestSellerEntity {
  BestSellerEntity({
    this.rateAvg,
    this.rateCount,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.imgCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity,
    this.category,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isSuperAdmin,
    this.sold,
  });
  double? rateAvg;
  int? rateCount;
  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  double? price;
  double? priceAfterDiscount;
  int? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  int? v;
  bool? isSuperAdmin;
  int? sold;


  toJson() {
    return {
      "rateAvg": rateAvg,
      "rateCount": rateCount,
      "_id": id,
      "title": title,
      "slug": slug,
      "description": description,
      "imgCover": imgCover,
      "images": images,
      "price": price,
      "priceAfterDiscount": priceAfterDiscount,
      "quantity": quantity,
      "category": category,
      "occasion": occasion,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "__v": v,
      "isSuperAdmin": isSuperAdmin,
      "sold": sold,
    };
  }
}


