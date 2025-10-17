class AddressResponseEntity {
  final String? message;
  final List<AddressEntity>? address;
    final List<AddressEntity>? addresses;

  const AddressResponseEntity({
    this.message,
    this.address,
    this.addresses,
  });
}

class AddressEntity {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  // ignore: unused_field
  final String? _id;
  const AddressEntity({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    String? id,
  }) : _id = id;
}
