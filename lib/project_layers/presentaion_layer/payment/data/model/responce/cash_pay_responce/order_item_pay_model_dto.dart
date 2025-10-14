import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/cash_pay_responce/product_pay_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_item_pay_model_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderItemDto {
  @JsonKey(name: 'product')
  final ProductPayModelDto productDto;
  final double price;
  final int quantity;
  @JsonKey(name: '_id')
  final String? id;

  OrderItemDto({
    required this.productDto,
    required this.price,
    required this.quantity,
    required this.id,
  });

  factory OrderItemDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemDtoToJson(this);
}
