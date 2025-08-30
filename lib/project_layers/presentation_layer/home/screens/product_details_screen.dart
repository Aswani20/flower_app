import 'package:carousel_slider/carousel_slider.dart';
import 'package:flower_app/core/extensions/project_extensions.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flower_app/project_layers/presentation_layer/home/screens/dot_indicator.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  int selectedPage = 0;
  List<String> images = [
    'assets/icons/add_icon.png',
    'assets/images/no_routes.png',
    'assets/icons/add_icon.png',
    'assets/images/no_routes.png',
    'assets/icons/add_icon.png',
    'assets/images/no_routes.png',
    'assets/icons/add_icon.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: context.height * 0.5,
                width: context.width,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      carouselController: carouselSliderController,
                      items: images.map((image) => Image.asset(image, width: context.width, fit: BoxFit.fill)).toList(),
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
                        padding: const EdgeInsets.all(8.0),
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
                      child: DotIndicator(imagesList: images, controller: carouselSliderController, selectedPage: selectedPage),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${context.l10n.egp} ',
                                    style: AppStyles.bold20black,
                                  ),
                                  TextSpan(
                                    text: context.l10n.product_price,
                                    style: AppStyles.bold20black,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              context.l10n.all_prices_include_tax,
                              style: AppStyles.regular13grey,
                            ),
                            Text(
                              context.l10n.product_title,
                              style: AppStyles.medium16black,
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${context.l10n.status}: ',
                                style: AppStyles.medium16black,
                              ),
                              TextSpan(
                                text: context.l10n.in_stock,
                                style: AppStyles.regular14black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.description,
                          style: AppStyles.medium16black,
                        ),
                        Text(
                          context.l10n.description_body,
                          style: AppStyles.regular14black,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.bouquet_include,
                          style: AppStyles.medium16black,
                        ),
                        4.heightBox,
                        Text(
                          context.l10n.pink_roses,
                          style: AppStyles.regular14black,
                        ),
                        Text(
                          context.l10n.white_wrap,
                          style: AppStyles.regular14black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    context.l10n.add_to_cart,
                    style: AppStyles.medium16black.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
