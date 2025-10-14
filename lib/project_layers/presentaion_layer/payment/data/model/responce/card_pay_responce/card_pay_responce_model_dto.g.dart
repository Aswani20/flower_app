// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_pay_responce_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardPayResponceModelDto _$CardPayResponceModelDtoFromJson(
  Map<String, dynamic> json,
) => CardPayResponceModelDto(
  message: json['message'] as String,
  session: SessionPayResponceDto.fromJson(
    json['session'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$CardPayResponceModelDtoToJson(
  CardPayResponceModelDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'session': instance.session,
};
