import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_bloc_builder.dart';
import 'orders_filter.dart';

class OrdersBody extends StatefulWidget {
  const OrdersBody({super.key});

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: OrdersFilter(
                    isSelected: selectedIndex == 0,
                    text: context.l10n.active,
                  ),
                ),
              ),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: OrdersFilter(
                    isSelected: selectedIndex == 1,
                    text: context.l10n.completed,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),

        OrdersBlocBuilder(selectedIndex: selectedIndex),
      ],
    );
  }
}
