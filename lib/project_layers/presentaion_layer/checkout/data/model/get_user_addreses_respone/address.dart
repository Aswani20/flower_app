
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/entities/address.dart';

class AddressDto {
  String? street;
  String? phone;
  String? city;
  String? lat;
  String? long;
  String? username;
  String? id;

  AddressDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory AddressDto.fromJson(Map<String, dynamic> json) => AddressDto(
    street: json['street'] as String?,
    phone: json['phone'] as String?,
    city: json['city'] as String?,
    lat: json['lat'] as String?,
    long: json['long'] as String?,
    username: json['username'] as String?,
    id: json['_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'street': street,
    'phone': phone,
    'city': city,
    'lat': lat,
    'long': long,
    'username': username,
    '_id': id,
  };

  Address toEntity() => Address(
    street: street,
    phone: phone,
    city: city,
    lat: lat,
    long: long,
    username: username,
    id: id,
  );
}
