import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flower_app/project_layers/firebase_layer/firestore_manager.dart';
import 'package:flower_app/project_layers/firebase_layer/models/orders_response_dto.dart';
import 'package:flower_app/core/enum/order_state_enum.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'track_order_states.dart';

@injectable
class TrackOrderViewModel
    extends Cubit<TrackOrderStates> {
  late String orderId;
  TrackOrderViewModel() : super(TrackOrderInitialState());

  StreamSubscription<OrdersDto?>? _orderSubscription;

  Future<void> loadOrderData(String orderId) async {
    this.orderId = orderId;
    emit(TrackOrderLoadingState());

    try {
      // Subscribe to real-time order updates from Firebase
      _orderSubscription =
          FirebaseUtils.fetchOrderFromFirebase(
            orderId: orderId,
          ).listen(
            (order) {
              if (order != null) {
                _handleOrderUpdate(order);
              } else {
                emit(
                  TrackOrderErrorState(
                    'Driver not assigned yet',
                  ),
                );
              }
            },
            onError: (error) {
              emit(
                TrackOrderErrorState(
                  'Failed to load order: $error',
                ),
              );
            },
          );
    } catch (e) {
      emit(
        TrackOrderErrorState(
          'Failed to load order data: ${e.toString()}',
        ),
      );
    }
  }

  void _handleOrderUpdate(OrdersDto order) {
    try {
      print('Order data updated: ${order.state}');
      // Convert order state string to enum
      OrderState currentOrderState = _parseOrderState(
        order.state ?? '',
      );

      // Create order status timeline
      final orderStatuses = _createOrderStatusTimeline(
        currentOrderState,
        order.createdAt ?? '',
        order.updatedAt ?? '',
      );

      // Find current status index
      int currentStatusIndex = orderStatuses.indexWhere(
        (status) =>
            status.orderState == currentOrderState,
      );

      if (currentStatusIndex == -1) {
        currentStatusIndex = 0;
      }
      emit(
        TrackOrderLoadedState(
          order: order,
          orderStatuses: orderStatuses,
          currentStatusIndex: currentStatusIndex,
        ),
      );
    } catch (e) {
      emit(
        TrackOrderErrorState(
          'Error processing order data: ${e.toString()}',
        ),
      );
    }
  }

  OrderState _parseOrderState(String stateString) {
    // Normalize the string: trim and convert to lowercase
    final normalized = stateString.trim().toLowerCase();

    // Match against all possible variations
    if (normalized.contains('received') ||
        normalized == 'received') {
      return OrderState.receivedYourOrder;
    } else if (normalized.contains('preparing') ||
        normalized == 'preparing') {
      return OrderState.preparingYourOrder;
    } else if (normalized.contains('delivery') ||
        normalized == 'outfordelivery') {
      return OrderState.outForDelivery;
    } else if (normalized.contains('delivered') ||
        normalized == 'delivered') {
      return OrderState.delivered;
    } else if (normalized.contains('arrived') ||
        normalized == 'arrived') {
      return OrderState.delivered;
    }

    return OrderState.receivedYourOrder; // Default state
  }

  List<OrderStatus> _createOrderStatusTimeline(
    OrderState currentState,
    String createdAt,
    String updatedAt,
  ) {
    final String formattedCreatedAt = DateFormat(
      'yyyy-MMM-dd HH:mm',
    ).format(DateTime.parse(createdAt));
    final String formattedUpdatedAt =
        DateFormat('yyyy-MMM-dd HH:mm').format(
          DateTime.fromMicrosecondsSinceEpoch(
            int.parse(updatedAt),
          ),
        );

    return [
      OrderStatus(
        title: OrderState.receivedYourOrder.toString(),
        dateTime: formattedCreatedAt,
        isCompleted: _isStateCompleted(
          OrderState.receivedYourOrder,
          currentState,
        ),
        orderState: OrderState.receivedYourOrder,
      ),
      OrderStatus(
        title: OrderState.preparingYourOrder.toString(),
        dateTime:
            currentState.index >=
                OrderState.preparingYourOrder.index
            ? formattedUpdatedAt
            : 'Pending',
        isCompleted: _isStateCompleted(
          OrderState.preparingYourOrder,
          currentState,
        ),
        orderState: OrderState.preparingYourOrder,
      ),
      OrderStatus(
        title: OrderState.outForDelivery.toString(),
        dateTime:
            currentState.index >=
                OrderState.outForDelivery.index
            ? formattedUpdatedAt
            : 'Pending',
        isCompleted: _isStateCompleted(
          OrderState.outForDelivery,
          currentState,
        ),
        orderState: OrderState.outForDelivery,
      ),
      OrderStatus(
        title: OrderState.delivered.toString(),
        dateTime: currentState == OrderState.delivered
            ? formattedUpdatedAt
            : 'Pending',
        isCompleted: _isStateCompleted(
          OrderState.delivered,
          currentState,
        ),
        orderState: OrderState.delivered,
      ),
    ];
  }

  bool _isStateCompleted(
    OrderState checkState,
    OrderState currentState,
  ) {
    return checkState.index <= currentState.index;
  }

  @override
  Future<void> close() {
    _orderSubscription?.cancel();
    return super.close();
  }
}
