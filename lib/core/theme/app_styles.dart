import 'package:flower_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle font15BlackW500 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
  static TextStyle font20BlackW500 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle font14BlackW500 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );
  static TextStyle font13WhiteW500 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
  static TextStyle font12grayW500LineThrough = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
    decoration: TextDecoration.lineThrough,
  );
  static TextStyle font12greenW500 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
  );
  static TextStyle font12blackW400 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );
}
