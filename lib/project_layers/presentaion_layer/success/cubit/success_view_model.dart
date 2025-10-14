import 'dart:async';
import 'package:flower_app/project_layers/firebase_layer/firestore_manager.dart';
import 'package:flower_app/project_layers/presentaion_layer/success/cubit/success_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SuccessViewModel extends Cubit<SuccessStates> {
  SuccessViewModel() : super(SuccessInitialState());

  StreamSubscription? _orderSubscription;

  /// Check if order exists in Firestore with real-time updates
  void checkOrderExists(String orderId) {
    debugPrint('🔍 Checking if order exists: $orderId');
    emit(OrderCheckingState());

    // Cancel previous subscription if exists
    _orderSubscription?.cancel();

    // Listen to Firebase stream for real-time updates
    _orderSubscription =
        FirebaseUtils.fetchOrderFromFirebase(
          orderId: orderId,
        ).listen(
          (orderData) {
            if (orderData != null) {
              debugPrint(
                '✅ Order exists in Firestore: $orderId',
              );
              emit(OrderExistsState(orderId));
            } else {
              debugPrint(
                '❌ Order does not exist in Firestore: $orderId',
              );
              emit(OrderNotExistsState());
            }
          },
          onError: (error) {
            debugPrint(
              '⚠️ Error checking order existence: $error',
            );
            emit(OrderCheckErrorState(error.toString()));
          },
        );
  }

  @override
  Future<void> close() {
    _orderSubscription?.cancel();
    return super.close();
  }
}
