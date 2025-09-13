import '../../../domain_layer/entities/orders_entity.dart';

class OrdersState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String? errorMessage;
  final List<OrdersEntity>? allOrders;
  final List<OrdersEntity>? pendingOrders;
  final List<OrdersEntity>? completedOrders;

  const OrdersState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isFailure = false,
    this.errorMessage,
    this.allOrders,
    this.pendingOrders,
    this.completedOrders,
  });

  OrdersState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isFailure,
    String? errorMessage,
    List<OrdersEntity>? allOrders,
    List<OrdersEntity>? pendingOrders,
    List<OrdersEntity>? completedOrders,
  }) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      errorMessage: errorMessage ?? this.errorMessage,
      allOrders: allOrders ?? this.allOrders,
      pendingOrders: pendingOrders ?? this.pendingOrders,
      completedOrders:
          completedOrders ?? this.completedOrders,
    );
  }
}
