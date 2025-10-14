import 'package:flower_app/project_layers/firebase_layer/models/orders_response_dto.dart';
import 'package:flower_app/core/enum/order_state_enum.dart';

/// Base class for Track Order states
abstract class TrackOrderStates {}

/// Initial state when the screen is first loaded
class TrackOrderInitialState extends TrackOrderStates {}

/// Loading state while fetching order data
class TrackOrderLoadingState extends TrackOrderStates {}

/// Success state when order data is loaded
class TrackOrderLoadedState extends TrackOrderStates {
  final OrdersDto order;
  final List<OrderStatus> orderStatuses;
  final int currentStatusIndex;

  TrackOrderLoadedState({
    required this.order,
    required this.orderStatuses,
    required this.currentStatusIndex,
  });
}

/// Error state when something goes wrong
class TrackOrderErrorState extends TrackOrderStates {
  final String error;

  TrackOrderErrorState(this.error);
}

/// Model for order status
class OrderStatus {
  final String title;
  final String dateTime;
  final bool isCompleted;
  final OrderState orderState;

  OrderStatus({
    required this.title,
    required this.dateTime,
    required this.isCompleted,
    required this.orderState,
  });
}
