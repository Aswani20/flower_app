// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_pay_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionPayResponceDto _$SessionPayResponceDtoFromJson(
  Map<String, dynamic> json,
) => SessionPayResponceDto(
  id: json['id'] as String,
  object: json['object'] as String,
  amount_subtotal: (json['amount_subtotal'] as num).toInt(),
  amount_total: (json['amount_total'] as num).toInt(),
  currency: json['currency'] as String,
  client_reference_id: json['client_reference_id'] as String?,
  payment_status: json['payment_status'] as String?,
  status: json['status'] as String?,
  success_url: json['success_url'] as String?,
  cancel_url: json['cancel_url'] as String?,
  customer_details: json['customer_details'] == null
      ? null
      : CustomerDetailsModelDto.fromJson(
          json['customer_details'] as Map<String, dynamic>,
        ),
  metadata: json['metadata'] as Map<String, dynamic>?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$SessionPayResponceDtoToJson(
  SessionPayResponceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'object': instance.object,
  'amount_subtotal': instance.amount_subtotal,
  'amount_total': instance.amount_total,
  'currency': instance.currency,
  'client_reference_id': instance.client_reference_id,
  'payment_status': instance.payment_status,
  'status': instance.status,
  'success_url': instance.success_url,
  'cancel_url': instance.cancel_url,
  'customer_details': instance.customer_details,
  'metadata': instance.metadata,
  'url': instance.url,
};
