import 'package:equatable/equatable.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_card_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_cash_entity.dart';

// ignore: must_be_immutable
class PaymentState extends Equatable {
  bool isLoadding;
  String errorMessage;
  bool isSuccessCash;
  PaymentCardEntity? paymentCardEntity;
  PaymentCashEntity? paymentCashEntity;
  PaymentState({
    this.isSuccessCash = false,
    this.isLoadding = false,
    this.errorMessage = '',
    this.paymentCardEntity,
    this.paymentCashEntity,
  });
  PaymentState copyWith({
    bool? isSuccessCash,
    bool? isLoadding,
    String? errorMessage,
    PaymentCardEntity? paymentCardEntity,
    PaymentCashEntity? paymentCashEntity,
  }) {
    return PaymentState(
      isSuccessCash: isSuccessCash ?? this.isSuccessCash,
      isLoadding: isLoadding ?? this.isLoadding,
      errorMessage: errorMessage ?? this.errorMessage,
      paymentCardEntity: paymentCardEntity ?? this.paymentCardEntity,
      paymentCashEntity: paymentCashEntity ?? this.paymentCashEntity,
    );
  }

  @override
  List<Object?> get props => [
    isLoadding,
    paymentCardEntity,
    paymentCardEntity,
    errorMessage,
    isSuccessCash,
  ];
}
