import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_entity.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_states.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/cart_tab/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dot_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState
    extends State<ProductDetailsScreen> {
  final CarouselSliderController
  carouselSliderController = CarouselSliderController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    var productItem =
        ModalRoute.of(context)!.settings.arguments
            as ProductEntity;
    return BlocListener<CartViewModel, CartStates>(
      listener: (context, state) {
        if (state is AddCartLoadingStates) {
          Fluttertoast.showToast(
            msg: context.l10n.loading,
            backgroundColor: AppColors.grey,
          );
        } else if (state is AddCartErrorStates) {
          Fluttertoast.showToast(
            msg: "Sold Out",
            backgroundColor: AppColors.red,
          );
        } else {
          Fluttertoast.showToast(
            msg: "Item Added to Cart",
            backgroundColor: AppColors.green,
          );
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: context.height * 0.5,
                  width: context.width,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        carouselController:
                            carouselSliderController,
                        items: productItem.images!
                            .map(
                              (image) => Image.network(
                                image,
                                width: context.width,
                                fit: BoxFit.fill,
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          height: context.height,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              selectedPage = index;
                            });
                          },
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: DotIndicator(
                          imagesList: productItem.images!,
                          controller:
                              carouselSliderController,
                          selectedPage: selectedPage,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    spacing: 24,
                    children: [
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Column(
                            spacing: 4,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${context.l10n.egp} ',
                                      style: AppStyles
                                          .bold20black,
                                    ),
                                    TextSpan(
                                      text:
                                          "${productItem.price}",
                                      style: AppStyles
                                          .bold20black,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                context
                                    .l10n
                                    .all_prices_include_tax,
                                style: AppStyles
                                    .regular13grey,
                              ),
                              Text(
                                productItem.title ??
                                    context
                                        .l10n
                                        .product_title,
                                style: AppStyles
                                    .medium16black
                                    .copyWith(
                                      fontSize: 14,
                                    ),
                                maxLines: 2,
                                overflow:
                                    TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      '${context.l10n.status}: ',
                                  style: AppStyles
                                      .medium16black,
                                ),
                                TextSpan(
                                  text: context
                                      .l10n
                                      .in_stock,
                                  style: AppStyles
                                      .regular14black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        spacing: 8,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.description,
                            style:
                                AppStyles.medium16black,
                          ),
                          Text(
                            productItem.description ??
                                context
                                    .l10n
                                    .description_body,
                            style:
                                AppStyles.regular14black,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                      Column(
                        spacing: 4,
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.bouquet_include,
                            style:
                                AppStyles.medium16black,
                          ),
                          4.heightBox,
                          Text(
                            "${productItem.quantity} ${productItem.title}",
                            style:
                                AppStyles.regular14black,
                          ),
                          Text(
                            "Rating: ${productItem.rateAvg}",
                            style:
                                AppStyles.regular14black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      CartViewModel.get(
                        context,
                      ).addToCart(productItem.id!);
                    },
                    child: Text(
                      context.l10n.add_to_cart,
                      style: AppStyles.medium16black
                          .copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
