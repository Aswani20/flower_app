import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/view_model/occasion_cubit.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/view_model/occasion_state.dart';
import 'package:flower_app/project_layers/presentation_layer/occasion/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridBuilder extends StatelessWidget {
  const ProductsGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OccasionCubit, OccasionState>(
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
            return Center(child: Text(context.l10n.noProductsFound));
          }
          return Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = state.products![index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator to product details screen and give the product[index]
                          },
                          child: ProductItem(product: product),
                        );
                      },
                      childCount: state.products!.length,

                      // state
                      //     .products
                      //     ?.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 0.75,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
