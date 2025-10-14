import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/orders_cubit.dart';
import '../cubit/state.dart';
import 'order_list_view.dart';

class OrdersBlocBuilder extends StatelessWidget {
  const OrdersBlocBuilder({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state.isLoading) {
          return SizedBox(
            height:
                MediaQuery.of(context).size.height * .8,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.isSuccess) {
          return OrdersListView(
            orders: selectedIndex == 0
                ? state.pendingOrders!
                : state.completedOrders!,
          );
        } else if (state.errorMessage != '') {
          return SizedBox(
            height:
                MediaQuery.of(context).size.height * .8,
            child: Center(
              child: Text(state.errorMessage!),
            ),
          );
        } else {
          return const Text("something went wrong");
        }
      },
    );
  }
}
