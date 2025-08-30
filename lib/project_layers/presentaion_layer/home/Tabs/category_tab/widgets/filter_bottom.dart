import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FilterBottom extends StatelessWidget {
  FilterBottom({super.key});

  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 117,
      height: 34,
      child: FloatingActionButton(
        backgroundColor: AppColors.pink,
        onPressed: () {
          // showModalBottomSheetList(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: AppColors.white),

            const Text(
              'Filter',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
