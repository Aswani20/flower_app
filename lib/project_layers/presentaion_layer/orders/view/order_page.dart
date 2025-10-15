import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/app_bar_order_page.dart';
import '../widgets/orders_body.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<OrdersCubit>()..getUserOrders(),
      child: Scaffold(
        appBar: AppBarOrderPage(),
        body: const OrdersBody(),
      ),
    );
  }
}
