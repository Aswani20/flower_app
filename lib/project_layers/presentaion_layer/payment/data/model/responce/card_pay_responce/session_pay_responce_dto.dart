// ignore_for_file: non_constant_identifier_names

import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/card_pay_responce/customer_details_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_card_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'session_pay_responce_dto.g.dart';

@JsonSerializable()
class SessionPayResponceDto {
  final String id;
  final String object;
  final int amount_subtotal;
  final int amount_total;
  final String currency;
  final String? client_reference_id;
  final String? payment_status;
  final String? status;
  final String? success_url;
  final String? cancel_url;
  final CustomerDetailsModelDto? customer_details;
  final Map<String, dynamic>? metadata;
  final String? url;

  SessionPayResponceDto({
    required this.id,
    required this.object,
    required this.amount_subtotal,
    required this.amount_total,
    required this.currency,
    this.client_reference_id,
    this.payment_status,
    this.status,
    this.success_url,
    this.cancel_url,
    this.customer_details,
    this.metadata,
    this.url,
  });

  factory SessionPayResponceDto.fromJson(Map<String, dynamic> json) =>
      _$SessionPayResponceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SessionPayResponceDtoToJson(this);

  PaymentCardEntity toDomain() {
    return PaymentCardEntity(
      checkoutSessionId: id,
      status: status ?? '',
      amountTotal: amount_total,
      currency: currency,
      customerEmail: customer_details?.email ?? '',
      checkoutUrl: url ?? '',
    );
  }
}
