// ignore_for_file: deprecated_member_use
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryAddressCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onEdit;
  final VoidCallback onSelect;

  const DeliveryAddressCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onEdit,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        padding: const EdgeInsets.all(12),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: isSelected,
                        onChanged: (_) => onSelect(),
                        activeColor: Colors.pink,
                      ),
                      Expanded(
                        child: Text(
                                   maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                          title,
                          style: Theme.of(context).textTheme.displayMedium!
                              .copyWith(
                                color: AppColors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.grey.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit, color: AppColors.black),
            ),
          ],
        ),
      ),
    );
  }
}
