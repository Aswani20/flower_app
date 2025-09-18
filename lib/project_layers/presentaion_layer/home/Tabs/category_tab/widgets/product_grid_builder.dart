import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/widgets/grid_silver_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/category_cubit.dart';

class ProductsBuilder extends StatelessWidget {
  const ProductsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is ProductLoaded ||
          current is ProductError ||
          current is ProductLoading,
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.pink,
            ),
          );
        } else if (state is ProductError) {
          return Center(child: Text(state.message ?? ''));
        } else if (state is ProductLoaded) {
          if (state.products!.isEmpty) {
            return const Center(
              child: Text('No Products Found'),
            );
          }
          return GridSliverProduct(
            products: state.products!,
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
