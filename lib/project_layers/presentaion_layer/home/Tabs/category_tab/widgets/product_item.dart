import 'package:flower_app/core/extensions/spacer_media_quiey.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppColors.grey.withOpacity(.7),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.network(
                product.imgCover ??
                    'https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=1&w=500',

                width: double.infinity,
                height: 200,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 1.heightPercent(context)),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  product.title.toString(),

                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 6.0,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    Text(
                      "${'EGP'} ${product.priceAfterDiscount}",
                
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 1.widthPercent(context),
                    ),
                    Text(
                      "${product.price}",
                      style: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        decoration:
                            TextDecoration.lineThrough,
                        decorationColor: AppColors.grey,
                      ),
                    ),
                
                    // Text(
                    //   "${state.product.discount}%",
                
                    //   style: TextStyle(
                    //     color:
                    //         AppColors
                    //             .green,
                    //     fontSize: 12,
                    //     fontWeight:
                    //         FontWeight
                    //             .w400,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 147,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.pink,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    // context.l10n.addToCart,
                    'Add To Cart',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
