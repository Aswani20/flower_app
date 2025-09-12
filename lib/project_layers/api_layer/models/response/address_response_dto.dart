import 'package:flower_app/project_layers/domain_layer/entities/address_response_entity.dart';

class AddressResponseDto {
  final String? message;
  final List<AddressDto>? address;
  final List<AddressDto>? addresses;

  const AddressResponseDto({
    this.message,
    this.address,
    this.addresses,
  });
  AddressResponseDto copyWith({
    String? message,
    List<AddressDto>? address,
    List<AddressDto>? addresses,
  }) {
    return AddressResponseDto(
      message: message ?? this.message,
      address: address ?? this.address,
      addresses: addresses ?? this.addresses,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'message': message,
      'address': address
          ?.map<Map<String, dynamic>>(
            (data) => data.toJson(),
          )
          .toList(),
      'addresses': addresses
          ?.map<Map<String, dynamic>>(
            (data) => data.toJson(),
          )
          .toList(),
    };
  }

  static AddressResponseDto fromJson(
    Map<String, Object?> json,
  ) {
    return AddressResponseDto(
      message: json['message'] == null
          ? null
          : json['message'] as String,
      address: json['address'] == null
          ? null
          : (json['address'] as List)
                .map<AddressDto>(
                  (data) => AddressDto.fromJson(
                    data as Map<String, Object?>,
                  ),
                )
                .toList(),

      addresses: json['addresses'] == null
          ? null
          : (json['addresses'] as List)
                .map<AddressDto>(
                  (data) => AddressDto.fromJson(
                    data as Map<String, Object?>,
                  ),
                )
                .toList(),
    );
  }

  @override
  String toString() {
    return '''AddAddressResponseDto(
              message:$message,
address:${address.toString()},
addresses:${addresses.toString()}
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AddressResponseDto &&
        other.runtimeType == runtimeType &&
        other.message == message &&
        other.address == address &&
        other.addresses == addresses;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      message,
      address,
      addresses,
    );
  }

  AddressResponseEntity toEntity() {
    return AddressResponseEntity(
      message: message,
      address: address
          ?.map((address) => address.toEntity())
          .toList(),
      addresses: addresses
          ?.map((address) => address.toEntity())
          .toList(),
    );
  }
}

class AddressDto {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  final String? id;
  const AddressDto({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });
  AddressDto copyWith({
    String? street,
    String? phone,
    String? city,
    String? lat,
    String? long,
    String? username,
    String? id,
  }) {
    return AddressDto(
      street: street ?? this.street,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      username: username ?? this.username,
      id: id ?? this.id,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'street': street,
      'phone': phone,
      'city': city,
      'lat': lat,
      'long': long,
      'username': username,
      '_id': id,
    };
  }

  static AddressDto fromJson(Map<String, Object?> json) {
    return AddressDto(
      street: json['street'] == null
          ? null
          : json['street'] as String,
      phone: json['phone'] == null
          ? null
          : json['phone'] as String,
      city: json['city'] == null
          ? null
          : json['city'] as String,
      lat: json['lat'] == null
          ? null
          : json['lat'] as String,
      long: json['long'] == null
          ? null
          : json['long'] as String,
      username: json['username'] == null
          ? null
          : json['username'] as String,
      id: json['_id'] == null
          ? null
          : json['_id'] as String,
    );
  }

  @override
  String toString() {
    return '''Address(
                street:$street,
phone:$phone,
city:$city,
lat:$lat,
long:$long,
username:$username,
id:$id
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is AddressDto &&
        other.runtimeType == runtimeType &&
        other.street == street &&
        other.phone == phone &&
        other.city == city &&
        other.lat == lat &&
        other.long == long &&
        other.username == username &&
        other.id == id;
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType,
      street,
      phone,
      city,
      lat,
      long,
      username,
      id,
    );
  }

  AddressEntity toEntity() {
    return AddressEntity(
      street: street,
      phone: phone,
      city: city,
      lat: lat,
      long: long,
      username: username,
      id: id,
    );
  }
}
