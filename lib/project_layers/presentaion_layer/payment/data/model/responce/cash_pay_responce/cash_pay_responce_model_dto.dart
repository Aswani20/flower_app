import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/cash_pay_responce/order_pay_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'cash_pay_responce_model_dto.g.dart';

@JsonSerializable()
class CashPayResponceModelDto {
  final String message;
  @JsonKey(name: 'order')
  final OrderPayModelDto orderDto;

  CashPayResponceModelDto({required this.message, required this.orderDto});

  factory CashPayResponceModelDto.fromJson(Map<String, dynamic> json) =>
      _$CashPayResponceModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CashPayResponceModelDtoToJson(this);
}
