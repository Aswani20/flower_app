import 'package:flower_app/core/l10n/app_localizations.dart';
import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flower_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.svg.circleFlower,
                    width: 26.w,
                    height: 26.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.flowery,

                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColors.pink),
                  ),
                ],
              ),
              Stack(
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 29.w,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 15.w,
                      height: 15.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.red,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '3',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                color: AppColors.white,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // Image(
                //   image: AssetImage(
                //     Assets.icons.personIcon.toString(),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
