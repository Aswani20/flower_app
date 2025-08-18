import 'package:flutter/material.dart';

class MainBottom extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  const MainBottom({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0),
        ),

        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,

        padding: EdgeInsets.symmetric(
          // horizontal: horizontalPadding ? 23,
          // vertical: verticalPadding? ?? 10.h,
        ),

        // fixedSize: Size(
        //   // buttonWidth?.w ?? double.maxFinite,
        //   // buttonHeight ?? 50.h,
        // ),
      ),

      onPressed: onPressed,
      child: Text(buttonText, style: textStyle),
    );
  }
}
