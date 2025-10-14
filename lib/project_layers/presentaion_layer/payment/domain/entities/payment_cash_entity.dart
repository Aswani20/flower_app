class PaymentCashEntity {
  final String orderNumber;
  final double totalPrice;
  final String paymentType;
  final bool isPaid;
  final bool isDelivered;
  final String state;

  PaymentCashEntity({
    required this.orderNumber,
    required this.totalPrice,
    required this.paymentType,
    required this.isPaid,
    required this.isDelivered,
    required this.state,
  });
}
