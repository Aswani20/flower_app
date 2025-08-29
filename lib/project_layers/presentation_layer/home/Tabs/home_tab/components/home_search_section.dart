import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearchSection extends StatelessWidget {

  final void Function(String)? onChanged;

  const HomeSearchSection({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.svg.circleFlower,
          width: 24.w,
          height: 24.h,
        ),
        Text(
          AppLocalizations.of(context)!.flowery,
    
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: TextField(
            onChanged: onChanged,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5.h,
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.white[700]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: BorderSide(color: AppColors.white[700]!),
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                size: 24.sp,
                color: AppColors.white[700]!,
              ),
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: AppColors.white[700]),
            ),
          ),
        ),
      ],
    );
  }
}