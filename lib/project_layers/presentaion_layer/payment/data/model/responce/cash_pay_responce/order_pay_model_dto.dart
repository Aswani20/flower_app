import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/cash_pay_responce/order_item_pay_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_cash_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_pay_model_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderPayModelDto {
  final String? user;
  final List<OrderItemDto>? orderItems;
  final double? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? state;
  @JsonKey(name: '_id')
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? orderNumber;
  @JsonKey(name: '__v')
  final int? v;

  OrderPayModelDto({
    this.user,
    this.orderItems,
    this.totalPrice,
    this.paymentType,
    this.isPaid,
    this.isDelivered,
    this.state,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.orderNumber,
    this.v,
  });

  factory OrderPayModelDto.fromJson(Map<String, dynamic> json) =>
      _$OrderPayModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderPayModelDtoToJson(this);

  PaymentCashEntity toDomain() {
    return PaymentCashEntity(
      orderNumber: orderNumber ?? '',
      totalPrice: totalPrice ?? 0,
      paymentType: paymentType ?? '',
      isPaid: isPaid ?? false,
      isDelivered: isDelivered ?? false,
      state: state ?? '',
    );
  }
}
