import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/core/utils/widgets/custom_button.dart';
import 'package:flower_app/project_layers/domain_layer/entities/product_filter.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/cubit/category_cubit.dart';
import 'package:flower_app/project_layers/presentaion_layer/home/Tabs/category_tab/widgets/filter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 117.w,
      height: 34.h,
      child: FloatingActionButton(
        backgroundColor: AppColors.pink,
        onPressed: () {
          showModalBottomSheetList(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, color: AppColors.white),
            5.horizontalSpace,
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

  static Future<ProductFilter?> showModalBottomSheetList(
    BuildContext context,
  ) async {
    String? selectedFilterLocal;
    final cubit = context.read<CategoryCubit>();

    return showModalBottomSheet<ProductFilter?>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        final height = MediaQuery.of(context).size.height;
        return SizedBox(
          height: height * 0.65,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.0.r),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                    height: 5.h,
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                    ),
                  ),
                  Text(
                    'Sort by',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.pink,
                    ),
                  ),
                  FilterList(
                    onSelected: (value) {
                      selectedFilterLocal = value;
                    },
                  ),
                  CustomButton(
                    size: Size(double.infinity, 50.h),
                    borderRadius: 12,
                    onPressed: () {
                      // تطبيق الـ filter باستخدام الدالة الجديدة
                      cubit.updateFilter(
                        selectedFilterLocal,
                      );
                      Navigator.pop(context);
                    },
                    child: Text('Filter'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
