part of 'checkout_cubit.dart';

enum PaymentMethod { cashOnDelivery, creditCard }

class CheckoutState extends Equatable {
  final bool isLoading;
  final bool isSubmitting;
  final bool isGift;
  final List<Address> addresses;
  final Address? selectedAddress;
  final PaymentMethod? selectedPaymentMethod;
  final bool isOrderPlacedSuccess;
  final bool isOrderPlacedFalier;

  final String? giftStreet;
  final String? giftPhone;
  final String? giftCity;
  final String errorMessage;
  final PaymentCardEntity? paymentCardEntity;
  final PaymentCashEntity? paymentCashEntity;

  const CheckoutState({
    this.errorMessage = '',
    this.paymentCardEntity,
    this.paymentCashEntity,
    this.isOrderPlacedFalier = false,
    this.isOrderPlacedSuccess = false,
    this.isLoading = false,
    this.isSubmitting = false,
    this.isGift = false,
    this.addresses = const [],
    this.selectedAddress,
    this.selectedPaymentMethod,
    this.giftStreet,
    this.giftPhone,
    this.giftCity,
  });

  CheckoutState copyWith({
    String? errorMessage,
    PaymentCardEntity? paymentCardEntity,
    PaymentCashEntity? paymentCashEntity,
    bool? isOrderPlacedFalier,
    bool? isOrderPlacedSuccess,
    bool? isLoading,
    bool? isSubmitting,
    bool? isGift,
    List<Address>? addresses,
    Address? selectedAddress,
    PaymentMethod? selectedPaymentMethod,

    String? giftStreet,
    String? giftPhone,
    String? giftCity,
  }) {
    return CheckoutState(
      errorMessage: errorMessage ?? this.errorMessage,
      paymentCardEntity: paymentCardEntity ?? this.paymentCardEntity,
      paymentCashEntity: paymentCashEntity ?? this.paymentCashEntity,
      isOrderPlacedFalier: isOrderPlacedFalier ?? this.isOrderPlacedFalier,
      isOrderPlacedSuccess: isOrderPlacedSuccess ?? this.isOrderPlacedSuccess,
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isGift: isGift ?? this.isGift,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      selectedPaymentMethod:
          selectedPaymentMethod ?? this.selectedPaymentMethod,
      giftStreet: giftStreet ?? this.giftStreet,
      giftPhone: giftPhone ?? this.giftPhone,
      giftCity: giftCity ?? this.giftCity,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSubmitting,
    isGift,
    addresses,
    selectedAddress,
    selectedPaymentMethod,
    giftStreet,
    giftPhone,
    giftCity,
    isOrderPlacedFalier,
    isOrderPlacedSuccess,
  ];
}
