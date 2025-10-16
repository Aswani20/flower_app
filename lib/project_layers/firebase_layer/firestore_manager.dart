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
      debugPrint(
        '🔍 Fetching order $orderId from Firebase',
      );
      var ordersCollection = _getDriverCollection();

      return ordersCollection.doc(orderId).snapshots().map((
        snapshot,
      ) {
        if (!snapshot.exists) {
          debugPrint(
            '❌ Order document $orderId does not exist in Firebase',
          );
          return null;
        }
        if (snapshot.data() == null) {
          debugPrint(
            '❌ Order document $orderId exists but has no data',
          );
          return null;
        }

        final data = snapshot.data()!;
        debugPrint(
          '✅ Order data retrieved: driver=${data.driver?.firstName ?? 'No driver'}, state=${data.state}',
        );

        return data;
      });
    } catch (e) {
      debugPrint(
        '❌ Error setting up order stream from Firebase: $e',
      );
      return Stream.value(null);
    }
  }
}
