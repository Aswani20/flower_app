import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';

class OrdersFilter extends StatelessWidget {
  const OrdersFilter({super.key, required this.isSelected , required this.text});
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppColors.pink : Colors.grey.shade300,
            width: 3.h,
          ),
        ),

      ),
      child: Center(
        child: Text(
          style: Theme.of( context).textTheme.labelSmall!.copyWith(
            color: isSelected ? AppColors.pink : Colors.grey.shade400,
          ),
          text,),
      ),
    );
  }
}