import 'package:flower_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class OrdersFilter extends StatelessWidget {
  const OrdersFilter({
    super.key,
    required this.isSelected,
    required this.text,
  });

  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected
                ? AppColors.pink
                : Colors.grey.shade300,
            width: 3.h,
          ),
        ),
      ),
      child: Center(
        child: Text(
          style: AppStyles.medium16black.copyWith(
            color: isSelected
                ? AppColors.pink
                : Colors.grey.shade400,
          ),
          text,
        ),
      ),
    );
  }
}
