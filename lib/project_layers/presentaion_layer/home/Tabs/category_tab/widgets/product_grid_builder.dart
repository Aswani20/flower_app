import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/category_cubit.dart';

class ProductsGridBuilder extends StatelessWidget {
  const ProductsGridBuilder({super.key});

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
          return Expanded(
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(0),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product =
                            state.products![index];
                        return GestureDetector(
                          onTap: () {
                            // Navigator to product details screen and give the product[index]
                            Navigator.pushNamed(context, AppRoutes.productDetailsScreen, arguments: product);
                          },
                          child: ProductItem(
                            product: product,
                          ),
                        );
                      },
                      childCount: state.products!.length,

                      // state
                      //     .products
                      //     ?.length,
                    ),
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 2
                              .heightPercent(context),
                          crossAxisSpacing: 2
                              .widthPercent(context),
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
