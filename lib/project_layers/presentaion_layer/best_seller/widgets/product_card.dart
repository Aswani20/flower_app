import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../domain_layer/entities/best_seller_response_entity.dart';

class ProductCard extends StatelessWidget {
  final BestSellerEntity product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                color: AppColors.grey,
                image: product.imgCover != null
                    ? DecorationImage(
                        image: NetworkImage(
                          product.imgCover!,
                        ),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: product.imgCover == null
                  ? const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    )
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? 'Product Name',
                  style: AppStyles.font14BlackW500,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      'EGP ${product.sold?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      ' ${product.priceAfterDiscount?.toStringAsFixed(2) ?? '0.00'}',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                        decoration:
                            TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      ' ${product.quantity?.toStringAsFixed(2) ?? '0'}',
                      style: TextStyle(
                        color: AppColors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                if (product.price != null &&
                    (product.price! >
                        (product.price ?? 0)))
                  Expanded(
                    child: Text(
                      '\$${product.sold?.toStringAsFixed(2) ?? '0.00'}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration:
                            TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(22),
                          ),
                          elevation: 2,
                        ),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
