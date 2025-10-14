class ShippingAddressRequestEntity {
  final String street;
  final String phone;
  final String city;
  final String lat;
  final String long;

  ShippingAddressRequestEntity({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });
}
