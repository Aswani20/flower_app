import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/card_pay_responce/session_pay_responce_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'card_pay_responce_model_dto.g.dart';

@JsonSerializable()
class CardPayResponceModelDto {
  final String message;
  final SessionPayResponceDto session;

  CardPayResponceModelDto({required this.message, required this.session});

  factory CardPayResponceModelDto.fromJson(Map<String, dynamic> json) =>
      _$CardPayResponceModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CardPayResponceModelDtoToJson(this);
}
