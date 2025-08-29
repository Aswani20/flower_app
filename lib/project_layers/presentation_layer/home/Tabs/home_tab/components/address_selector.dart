import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressSelector extends StatelessWidget {
  const AddressSelector({super.key, this.onTap, required this.address});

  final Function()? onTap;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        SvgPicture.asset(Assets.svg.location),
        Text(address, style: TextStyle(color: AppColors.black[500]!)),
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(Assets.svg.arrowDown),
        ),
      ],
    );
  }
}
