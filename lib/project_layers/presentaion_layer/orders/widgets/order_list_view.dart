import 'package:flutter/material.dart';

import '../../../domain_layer/entities/orders_entity.dart';
import 'order_card.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({super.key, required this.orders});

  final List<OrdersEntity> orders;

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: const Center(
          child: Text('No orders found'),
        ),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: OrderCard(orderItem: orders[index]),
      ),
      itemCount: orders.length,
    );
  }
}
