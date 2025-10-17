import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/di.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/orders_body.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<OrdersCubit>()..getUserOrders(),
      child: Scaffold(
        appBar: AppBar(
          
          title:  Text(context.l10n.myOrders, ),
        ),
        body: const OrdersBody(),
      ),
    );
  }
}
