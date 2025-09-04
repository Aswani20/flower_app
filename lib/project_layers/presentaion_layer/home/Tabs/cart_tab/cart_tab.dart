import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/card_header.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_deliver_to_address.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_footer.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CardHeader(),
          8.heightBox,
          CartDeliverToAddress(),
          24.heightBox,
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => CartItem(),
              itemCount: 1,
            ),
          ),
          CartFooter(),
        ],
      ),
    );
  }
}
