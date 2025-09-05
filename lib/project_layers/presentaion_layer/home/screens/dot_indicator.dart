import 'package:carousel_slider/carousel_controller.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  List<String> imagesList;
  CarouselSliderController controller;
  int selectedPage;

  DotIndicator({
    super.key,
    required this.imagesList,
    required this.controller,
    required this.selectedPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imagesList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => controller.animateToPage(entry.key),
          child: Container(
            width: 12.0,
            height: 12.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: entry.key == selectedPage ? AppColors.pink : AppColors.grey.withValues(alpha: 0.3),
            ),
          ),
        );
      }).toList(),
    );
  }
}
