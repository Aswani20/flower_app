import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterList extends StatefulWidget {
  const FilterList({super.key, required this.onSelected});

  final ValueChanged<String?> onSelected;

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  String? selectedValue;

  final Map<String, String> filters = {
    'Lowest Price': 'price',
    'Highest Price': 'price_desc',
    'New': 'New',
    'Old': 'Old',
    'Discount': 'discount',
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filters.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final filterEntry = filters.entries.elementAt(
          index,
        );
        final filterName = filterEntry.key;
        final filterValue = filterEntry.value;

        return Container(
          padding: EdgeInsets.all(5.r),
          width: double.infinity,
          height: 60.h,
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Text(filterName),
              Radio<String>(
                value: filterValue,
                groupValue: selectedValue,
                activeColor: AppColors.pink,
                onChanged: (value) {
                  setState(() {
                    if (selectedValue == value) {
                      selectedValue = null;
                    } else {
                      selectedValue = value;
                    }
                    widget.onSelected(selectedValue);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
