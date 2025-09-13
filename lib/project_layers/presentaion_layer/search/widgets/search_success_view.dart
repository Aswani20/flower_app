import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/widgets/grid_silver_products.dart';
import 'package:flutter/material.dart';

class SearchSuccessView extends StatelessWidget {
  final List<ProductEntity> products;
  final String keyword;

  const SearchSuccessView({
    super.key,
    required this.products,
    required this.keyword,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          '${context.l10n.wasFound} ${products.length} ${context.l10n.resultFor} "$keyword"',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      GridSliverProduct(products: products),
    ],
  );
}
