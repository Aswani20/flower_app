// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_logged_user_data_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLoggedUserDataResponseDto _$GetLoggedUserDataResponseDtoFromJson(
  Map<String, dynamic> json,
) =>
    GetLoggedUserDataResponseDto(
        json['message'] as String?,
        json['user'] == null
            ? null
            : GetLoggedUserDataResponseDtoUser.fromJson(
                json['user'] as Map<String, dynamic>,
              ),
      )
      ..id = json['id'] as String?
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..email = json['email'] as String?
      ..gender = json['gender'] as String?
      ..phone = json['phone'] as String?
      ..photo = json['photo'] as String?
      ..role = json['role'] as String?
      ..createdAt = json['createdAt'] as String?;

Map<String, dynamic> _$GetLoggedUserDataResponseDtoToJson(
  GetLoggedUserDataResponseDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'createdAt': instance.createdAt,
  'message': instance.message,
  'user': instance.user,
};

GetLoggedUserDataResponseDtoUser _$GetLoggedUserDataResponseDtoUserFromJson(
  Map<String, dynamic> json,
) => GetLoggedUserDataResponseDtoUser(
  json['_id'] as String?,
  json['firstName'] as String?,
  json['lastName'] as String?,
  json['email'] as String?,
  json['gender'] as String?,
  json['phone'] as String?,
  json['photo'] as String?,
  json['role'] as String?,
  json['createdAt'] as String?,
);

Map<String, dynamic> _$GetLoggedUserDataResponseDtoUserToJson(
  GetLoggedUserDataResponseDtoUser instance,
) => <String, dynamic>{
  '_id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'gender': instance.gender,
  'phone': instance.phone,
  'photo': instance.photo,
  'role': instance.role,
  'createdAt': instance.createdAt,
};
