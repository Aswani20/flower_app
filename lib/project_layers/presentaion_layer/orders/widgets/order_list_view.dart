import 'package:flutter/material.dart';

import '../../../domain_layer/entities/orders_entity.dart';
import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<OrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16 , horizontal: 28),
        child: OrderCard(
          orderItem:  orders[index],
        ),
      ),
      itemCount: orders.length,
    );
  }
}