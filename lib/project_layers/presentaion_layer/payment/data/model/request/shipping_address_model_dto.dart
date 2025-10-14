import 'package:json_annotation/json_annotation.dart';
part 'shipping_address_model_dto.g.dart';

@JsonSerializable()
class ShippingAddressModelDto {
  final String street;
  final String phone;
  final String city;
  final String lat;
  final String long;

  ShippingAddressModelDto({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  factory ShippingAddressModelDto.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingAddressModelDtoToJson(this);
}
