import 'address.dart';

class GetUserAddresesRespone {
  String? message;
  List<AddressDto>? addresses;

  GetUserAddresesRespone({this.message, this.addresses});

  factory GetUserAddresesRespone.fromJson(Map<String, dynamic> json) {
    return GetUserAddresesRespone(
      message: json['message'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'addresses': addresses?.map((e) => e.toJson()).toList(),
  };
}
