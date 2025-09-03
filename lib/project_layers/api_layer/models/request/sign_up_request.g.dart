// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
SignUpRequestBody _$SignUpRequestBodyFromJson(
  Map<String, dynamic> json,
) => SignUpRequestBody(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  rePassword: json['rePassword'] as String?,
  phone: json['phone'] as String?,
  gender: json['gender'] as String?,
);

Map<String, dynamic> _$SignUpRequestBodyToJson(
  SignUpRequestBody instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'password': instance.password,
  'rePassword': instance.rePassword,
  'phone': instance.phone,
  'gender': instance.gender,
};
