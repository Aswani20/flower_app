import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/use_case/payment_card_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/use_case/payment_cash_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/view_model/payment_event.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/presentaion/view_model/payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PaymentCubit extends Cubit<PaymentState> {
  final PaymentCardUseCase _paymentCardUseCase;
  final PaymentCashUseCase _paymentCashUseCase;

  PaymentCubit(this._paymentCardUseCase, this._paymentCashUseCase)
    : super(PaymentState());
  doIntent(PaymentEvent event) {
    switch (event) {
      case PaymentCardEvent():
        return _paymentCard(event.shippingAddressRequestEntity);
      case PaymentCashEvent():
        return _paymentCash(event.shippingAddressRequestEntity);
      case ClearErorrMessageEvent():
        return _clearErrorMessage();
    }
  }

  Future<void> _paymentCard(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    emit(state.copyWith(isLoadding: true));
    var result = await _paymentCardUseCase(shippingAddressRequestEntity);
    switch (result) {
      case ApiSuccessResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            errorMessage: '',
            paymentCardEntity: result.data,
          ),
        );
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            errorMessage: result .errorMessage,
          ),
        );
    }
  }

  Future<void> _paymentCash(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    emit(state.copyWith(isLoadding: true));
    var result = await _paymentCashUseCase(shippingAddressRequestEntity);
    switch (result) {
      case ApiSuccessResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            isSuccessCash: true,

            paymentCashEntity: result.data,
          ),
        );
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoadding: false,
            errorMessage: result.errorMessage,
          ),
        );
    }
  }

  _clearErrorMessage() {
    emit(state.copyWith(errorMessage: ''));
  }
}
