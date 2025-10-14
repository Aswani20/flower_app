abstract class SuccessStates {}

class SuccessInitialState extends SuccessStates {}

class OrderCheckingState extends SuccessStates {}

class OrderExistsState extends SuccessStates {
  final String orderId;
  OrderExistsState(this.orderId);
}

class OrderNotExistsState extends SuccessStates {}

class OrderCheckErrorState extends SuccessStates {
  final String error;
  OrderCheckErrorState(this.error);
}
