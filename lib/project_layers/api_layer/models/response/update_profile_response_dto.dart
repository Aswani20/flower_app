import 'package:flower_app/project_layers/domain_layer/entities/UpdateProfileResponseEntity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain_layer/entities/get_logged_user_entity.dart';

part 'update_profile_response_dto.g.dart';

@JsonSerializable()
class UpdateProfileResponseDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  UpdateProfileResponseDto({this.message, this.user});

  factory UpdateProfileResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$UpdateProfileResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UpdateProfileResponseDtoToJson(this);
  }

  UpdateProfileResponseEntity toEntity() {
    UpdateProfileResponseEntity
    updateProfileResponseEntity =
        UpdateProfileResponseEntity(
          message: message,
          user: GetLoggedUserEntity(
            id: user?.Id,
            firstName: user?.firstName,
            lastName: user?.lastName,
            email: user?.email,
          ),
        );
    return updateProfileResponseEntity;
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "password")
  final String? password;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "wishlist")
  final List<dynamic>? wishlist;
  @JsonKey(name: "addresses")
  final List<dynamic>? addresses;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  User({
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}
