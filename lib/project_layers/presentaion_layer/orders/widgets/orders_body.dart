import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    return BlocListener<CartViewModel, CartStates>(
      listener: (context, state) {
        if (state is AddCartLoadingStates) {
          Fluttertoast.showToast(
            msg: context.l10n.loading,
            backgroundColor: AppColors.grey,
          );
        } else if (state is AddCartErrorStates) {
          Fluttertoast.cancel();
          Fluttertoast.showToast(
            msg: "Sold Out",
            backgroundColor: AppColors.red,
          );
        } else {
          Fluttertoast.cancel();

          Fluttertoast.showToast(
            msg: "Item Added to Cart",
            backgroundColor: AppColors.green,
          );
        }
      },
      child: ListView(
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
      ),
    );
  }
}
