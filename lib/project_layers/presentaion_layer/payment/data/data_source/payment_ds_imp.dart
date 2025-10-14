import 'package:flower_app/project_layers/api_layer/api_client/api_client.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/data_source/payment_ds.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/request/payment_request_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/card_pay_responce/card_pay_responce_model_dto.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/data/model/responce/cash_pay_responce/cash_pay_responce_model_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PaymentDataSource)
class PaymentDataSourceImp implements PaymentDataSource {
  final ApiClient _apiServices;
  PaymentDataSourceImp(this._apiServices);
  @override
  Future<CardPayResponceModelDto> cardPayment(
    PaymentRequestModelDto paymentRequestModelDto,
  ) {
    return _apiServices.paymentCard(paymentRequestModelDto);
  }

  @override
  Future<CashPayResponceModelDto> cashPayment(
    PaymentRequestModelDto paymentRequestModelDto,
  ) {
    return _apiServices.paymentCash(paymentRequestModelDto);
  }
}
