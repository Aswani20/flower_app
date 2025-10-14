import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDto {
  OrdersDto({
    this.id,
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
    this.store,
    this.driver,
  });

  OrdersDto.fromJson(dynamic json) {
    id = json['_id'];
    user = json['user'] != null
        ? UserDto.fromJson(json['user'])
        : null;
    if (json['orderItems'] != null) {
      orderItems = [];
      json['orderItems'].forEach((v) {
        orderItems?.add(OrderItemsDto.fromJson(v));
      });
    }
    totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    isPaid = json['isPaid'];
    isDelivered = json['isDelivered'];
    state = json['state'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    orderNumber = json['orderNumber'];
    v = json['__v'];
    store = json['store'] != null
        ? StoreDto.fromJson(json['store'])
        : null;
    driver = json['driver'] != null
        ? DriverDto.fromJson(json['driver'])
        : null;
  }

  String? id;
  UserDto? user;
  List<OrderItemsDto>? orderItems;
  num? totalPrice;
  String? paymentType;
  bool? isPaid;
  bool? isDelivered;
  String? state;
  String? createdAt;
  String? updatedAt;
  String? orderNumber;
  num? v;
  StoreDto? store;
  DriverDto? driver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (orderItems != null) {
      map['orderItems'] = orderItems
          ?.map((v) => v.toJson())
          .toList();
    }
    map['totalPrice'] = totalPrice;
    map['paymentType'] = paymentType;
    map['isPaid'] = isPaid;
    map['isDelivered'] = isDelivered;
    map['state'] = state;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['orderNumber'] = orderNumber;
    map['__v'] = v;
    if (store != null) {
      map['store'] = store?.toJson();
    }
    if (driver != null) {
      map['driver'] = driver?.toJson();
    }
    return map;
  }
}

class StoreDto {
  StoreDto({
    this.name,
    this.image,
    this.address,
    this.phoneNumber,
    this.latLong,
  });

  StoreDto.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];

    // Parse latLong - handle different formats
    if (json['latLong'] != null) {
      final latLongData = json['latLong'];

      // If it's a String "lat, long"
      if (latLongData is String) {
        try {
          final parts = latLongData.split(',');
          if (parts.length == 2) {
            latLong = LatLng(
              double.parse(parts[0].trim()),
              double.parse(parts[1].trim()),
            );
          }
        } catch (e) {
          print('⚠️ Error parsing latLong string: $e');
        }
      }
      // If it's a list [lat, long]
      else if (latLongData is List &&
          latLongData.length == 2) {
        latLong = LatLng(
          latLongData[0].toDouble(),
          latLongData[1].toDouble(),
        );
      }
      // If it's an object with lat/long or latitude/longitude fields
      else if (latLongData is Map) {
        final lat =
            latLongData['lat'] ?? latLongData['latitude'];
        final long =
            latLongData['long'] ??
            latLongData['longitude'];

        if (lat != null && long != null) {
          latLong = LatLng(
            lat is num
                ? lat.toDouble()
                : double.parse(lat.toString()),
            long is num
                ? long.toDouble()
                : double.parse(long.toString()),
          );
        }
      }
    }
  }

  String? name;
  String? image;
  String? address;
  String? phoneNumber;
  LatLng? latLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['address'] = address;
    map['phoneNumber'] = phoneNumber;

    // Serialize latLong as array [lat, long] for Firebase compatibility
    if (latLong != null) {
      map['latLong'] = [
        latLong!.latitude,
        latLong!.longitude,
      ];
    }

    return map;
  }
}

class OrderItemsDto {
  OrderItemsDto({
    this.product,
    this.price,
    this.quantity,
    this.id,
  });

  OrderItemsDto.fromJson(dynamic json) {
    product = json['product'] != null
        ? ProductDto.fromJson(json['product'])
        : null;
    price = json['price'];
    quantity = json['quantity'];
    id = json['_id'];
  }

  ProductDto? product;
  num? price;
  num? quantity;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['product'] = product?.toJson();
    }
    map['price'] = price;
    map['quantity'] = quantity;
    map['_id'] = id;
    return map;
  }
}

class ProductDto {
  ProductDto({
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
    this.discount,
    this.sold,
  });

  ProductDto.fromJson(dynamic json) {
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    imgCover = json['imgCover'];
    images = json['images'] != null
        ? json['images'].cast<String>()
        : [];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    quantity = json['quantity'];
    category = json['category'];
    occasion = json['occasion'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    discount = json['discount'];
    sold = json['sold'];
  }

  String? id;
  String? title;
  String? slug;
  String? description;
  String? imgCover;
  List<String>? images;
  num? price;
  num? priceAfterDiscount;
  num? quantity;
  String? category;
  String? occasion;
  String? createdAt;
  String? updatedAt;
  num? v;
  num? discount;
  num? sold;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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
    map['discount'] = discount;
    map['sold'] = sold;
    return map;
  }
}

class UserDto {
  UserDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.passwordChangedAt,
  });

  UserDto.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    phone = json['phone'];
    photo = json['photo'];
    passwordChangedAt = json['passwordChangedAt'];
  }

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? passwordChangedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['phone'] = phone;
    map['photo'] = photo;
    map['passwordChangedAt'] = passwordChangedAt;
    return map;
  }
}

class DriverDto {
  DriverDto({
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.email,
    this.phone,
    this.photo,
    this.id,
    this.lat,
    this.long,
  });

  DriverDto.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    vehicleType = json['vehicleType'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    id = json['_id'];
    lat = json['lat'];
    long = json['long'];
  }

  String? firstName;
  String? lastName;
  String? vehicleType;
  String? email;
  String? phone;
  String? photo;
  String? lat;
  String? long;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['vehicleType'] = vehicleType;

    map['email'] = email;

    map['phone'] = phone;
    map['photo'] = photo;
    map['lat'] = lat;
    map['long'] = long;
    map['_id'] = id;

    return map;
  }
}
