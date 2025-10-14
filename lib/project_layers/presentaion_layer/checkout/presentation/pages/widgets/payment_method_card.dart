// ignore_for_file: deprecated_member_use

import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onSelect;

  const PaymentMethodCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.labelSmall!.copyWith(color: AppColors.black),
            ),
          ),
          Radio<bool>(
            value: true,
            groupValue: isSelected,
            onChanged: (_) => onSelect(),
          ),
        ],
      ),
    );
  }
}
