import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flower_app/core/api_result/api_result.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/entities/address.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/domin/usecase/get_logged_user_addresses_usecase.dart';
import 'package:flower_app/project_layers/presentaion_layer/checkout/presentation/view_model/cubit/checkout/checkout_event.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_card_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/payment_cash_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/entities/shipping_address_request_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/use_case/payment_card_use_case.dart';
import 'package:flower_app/project_layers/presentaion_layer/payment/domain/use_case/payment_cash_use_case.dart';
import 'package:injectable/injectable.dart';

part 'checkout_state.dart';

@injectable
class CheckoutCubit extends Cubit<CheckoutState> {
  final GetLoggedUserAddressesUsecase getLoggedUserAddressesUsecase;
  final PaymentCardUseCase _cardUseCase;
  final PaymentCashUseCase _cashUseCase;

  CheckoutCubit(
    this.getLoggedUserAddressesUsecase,
    this._cardUseCase,
    this._cashUseCase,
  ) : super(const CheckoutState());

  void doIntent(CheckoutEvent event) {
    switch (event) {
      case PlaceOrder():
        placeOrder();
      case ToggleGift():
        toggleGift(event.value);
      case UpdateGiftStreet():
        updateGiftStreet(event.street);
      case UpdateGiftPhone():
        updateGiftPhone(event.phone);
      case UpdateGiftCity():
        updateGiftCity(event.city);
      case SelectPaymentMethod():
        selectPaymentMethod(event.method);
      case SelectAddress():
        selectAddress(event.address);
      case GetLoggedUserAddresses():
        getLoggedUserAddresses();

      case PaymentCardEvent():
        _paymentCard(event.shippingAddressRequestEntity);
      case PaymentCashEvent():
        _paymentCash(event.shippingAddressRequestEntity);
    }
  }

  Future<void> _paymentCard(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    //  emit(state.copyWith(isLoadding: true));
    var result = await _cardUseCase(shippingAddressRequestEntity);
    switch (result) {
      case ApiSuccessResult():
        return emit(
          state.copyWith(
            paymentCardEntity: result.data,
            isOrderPlacedSuccess: true,
          ),
        );
      // case ApiErrorResult():
      case ApiErrorResult<PaymentCardEntity>():
        return emit(
          state.copyWith(
            errorMessage: result.errorMessage,
            isOrderPlacedFalier: true,
          ),
        );
    }
  }

  Future<void> _paymentCash(
    ShippingAddressRequestEntity shippingAddressRequestEntity,
  ) async {
    //  emit(state.copyWith(isLoadding: true));
    var result = await _cashUseCase(shippingAddressRequestEntity);
    switch (result) {
      case ApiSuccessResult():
        return emit(
          state.copyWith(
            isOrderPlacedSuccess: true,

            paymentCashEntity: result.data,
          ),
        );
      // case ApiErrorResult():
      case ApiErrorResult<PaymentCashEntity>():
        return emit(
          state.copyWith(
            isOrderPlacedFalier: true,
            errorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> getLoggedUserAddresses() async {
    emit(state.copyWith(isLoading: true));
    final result = await getLoggedUserAddressesUsecase.invok();
    switch (result) {
      case ApiSuccessResult<List<Address>>():
        emit(state.copyWith(isLoading: false, addresses: result.data));
        break;
      case ApiErrorResult<List<Address>>():
        emit(state.copyWith(isLoading: false));
        break;
    }
  }

  void selectAddress(Address address) {
    emit(state.copyWith(selectedAddress: address));
  }

  void selectPaymentMethod(PaymentMethod method) {
    emit(state.copyWith(selectedPaymentMethod: method));
  }

  void toggleGift(bool value) {
    emit(
      state.copyWith(
        isGift: value,
        selectedPaymentMethod: value ? PaymentMethod.creditCard : null,

        giftStreet:  '',
        giftPhone:  '',
        giftCity: '',
      ),
    );
  }

  void updateGiftStreet(String name) {
    emit(state.copyWith(giftStreet: name));
  }

  void updateGiftPhone(String phone) {
    emit(state.copyWith(giftPhone: phone));
  }

  void updateGiftCity(String city) {
    emit(state.copyWith(giftCity: city));
  }

  Future<void> placeOrder() async {
    if (!state.isGift && state.selectedAddress == null) {
      return;
    }

    if (state.isGift &&
        (state.giftStreet == null ||
            state.giftStreet!.isEmpty ||
            state.giftPhone == null ||
            state.giftPhone!.isEmpty ||
            state.giftCity == null ||
            state.giftCity!.isEmpty)) {
      return;
    }

    if (state.selectedPaymentMethod == null) {
      emit(state.copyWith());
      return;
    }

    emit(state.copyWith(isSubmitting: true));

    switch (state.selectedPaymentMethod) {
      case PaymentMethod.cashOnDelivery:
        state.isGift
            ? _paymentCash(
                ShippingAddressRequestEntity(
                  city: state.giftCity ?? '',
                  street: state.giftStreet ?? '',
                  lat: '',
                  long: '',
                  phone: state.giftPhone ?? '',
                ),
              )
            : _paymentCash(
                ShippingAddressRequestEntity(
                  city: state.selectedAddress!.city ?? '',
                  street: state.selectedAddress!.street ?? '',
                  lat: state.selectedAddress!.lat ?? '',
                  long: state.selectedAddress!.long ?? '',
                  phone: state.selectedAddress!.phone ?? '',
                ),
              );
      case PaymentMethod.creditCard:
        state.isGift
            ? _paymentCard(
                ShippingAddressRequestEntity(
                  city: state.giftCity ?? '',
                  street: state.giftStreet ?? '',
                  lat: '',
                  long: '',
                  phone: state.giftPhone ?? '',
                ),
              )
            : _paymentCard(
                ShippingAddressRequestEntity(
                  city: state.selectedAddress!.city ?? '',
                  street: state.selectedAddress!.street ?? '',
                  lat: state.selectedAddress!.lat ?? '',
                  long: state.selectedAddress!.long ?? '',
                  phone: state.selectedAddress!.phone ?? '',
                ),
              );
      case null:
        emit(state.copyWith(isSubmitting: false, isOrderPlacedFalier: true));
    }
  }
}
