import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/di.dart';
import '../../../../core/l10n/app_localizations.dart';
import '../cubit/orders_cubit.dart';
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
        appBar: AppBar(
          title: Text(
            "Orders",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium,
          ),

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const OrdersBody(),
      ),
    );
  }
}
