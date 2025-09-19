import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/route/app_routes.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/widgets/product_item.dart';
import 'package:flutter/widgets.dart';

class GridSliverProduct extends StatelessWidget {
  final List<ProductEntity> products;

  const GridSliverProduct({
    required this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator to product details screen and give the product[index]
                    Navigator.pushNamed(
                      context,
                      AppRoutes.productDetailsScreen,
                      arguments: product,
                    );
                  },
                  child: ProductItem(product: product),
                );
              },
              childCount: products.length,

              // state
              //     .products
              //     ?.length,
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.heightPercent(
                    context,
                  ),
                  crossAxisSpacing: 2.widthPercent(
                    context,
                  ),
                  childAspectRatio: 0.75,
                ),
          ),
        ],
      ),
    );
  }
}
