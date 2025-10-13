import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flower_app/project_layers/firebase_layer/models/orders_response_dto.dart';
import 'package:flutter/material.dart';

class FirebaseUtils {
  static CollectionReference<OrdersDto>
  _getDriverCollection() {
    return FirebaseFirestore.instance
        .collection('OrdersInfo')
        .withConverter<OrdersDto>(
          fromFirestore: (snapshot, options) =>
              OrdersDto.fromJson(snapshot.data()!),
          toFirestore: (orderInfo, options) =>
              orderInfo.toJson(),
        );
  }

  /// fetch Order From Firebase as Stream for real-time updates
  static Stream<OrdersDto?> fetchOrderFromFirebase({
    required String orderId,
  }) {
    try {
      var ordersCollection = _getDriverCollection();
      return ordersCollection
          .doc(orderId)
          .snapshots()
          .map((snapshot) {
            if (!snapshot.exists ||
                snapshot.data() == null) {
              return null;
            }
            return snapshot.data()!;
          });
    } catch (e) {
      debugPrint(
        'Error setting up order stream from Firebase:/ $e',
      );
      // Return a stream that emits null in case of error
      return Stream.value(null);
    }
  }
}
