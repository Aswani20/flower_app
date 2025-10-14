import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../cubit/orders_cubit.dart';
import '../widgets/app_bar_order_page.dart';
import '../widgets/orders_body.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});

  final viewModel = getIt<OrdersCubit>();

  @override
  Widget build(BuildContext context) {
    var trans = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBarOrderPage(),
        body: const OrdersBody(),
      ),
    );
  }
}
