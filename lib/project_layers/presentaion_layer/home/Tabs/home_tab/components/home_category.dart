import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/project_layers/domain_layer/entities/category_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({super.key, required this.category, this.onTap});

  final CategoryEntity? category;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: 70.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: AppColors.lightPink,
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: CachedNetworkImage(
              width: 35.w,
              height: 35.h,
              imageUrl: category!.image!,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
        Text(
          category!.name!,
          style: Theme.of(
            context,
          ).textTheme.labelSmall!.copyWith(color: AppColors.black),
        ),
      ],
    );
  }
}
