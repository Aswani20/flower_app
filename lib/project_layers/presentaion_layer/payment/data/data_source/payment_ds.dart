import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/card_pay_responce/card_pay_responce_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/cash_pay_responce/cash_pay_responce_model_dto.dart';

abstract class PaymentDataSource {
  Future<CardPayResponceModelDto> cardPayment(
    PaymentRequestModelDto paymentRequestModelDto,
  );
  Future<CashPayResponceModelDto> cashPayment(
    PaymentRequestModelDto paymentRequestModelDto,
  );
}
