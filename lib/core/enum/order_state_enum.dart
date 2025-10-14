enum OrderState {
  receivedYourOrder,
  preparingYourOrder,
  outForDelivery,
  delivered;

  // Convert the enum value to a user-friendly string
  String toString() {
    switch (this) {
      case OrderState.receivedYourOrder:
        return 'Received your order';
      case OrderState.preparingYourOrder:
        return 'Preparing your order';
      case OrderState.outForDelivery:
        return 'Out for delivery';
      case OrderState.delivered:
        return 'Delivered';
    }
  }
}
