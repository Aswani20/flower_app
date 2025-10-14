class PaymentCardEntity {
  final String checkoutSessionId;
  final String status;
  final int amountTotal;
  final String currency;
  final String customerEmail;
  final String checkoutUrl;

  PaymentCardEntity({
    required this.checkoutSessionId,
    required this.status,
    required this.amountTotal,
    required this.currency,
    required this.customerEmail,
    required this.checkoutUrl,
  });
}
