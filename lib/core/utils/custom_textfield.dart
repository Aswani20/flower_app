import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final int? maxLength;
  final TextStyle? textStyle;
  final String? hintText;
  final double borderRadius;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? obscuringCharacter;
  final Widget? suffixIcon;
  final Color fillColor;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final EdgeInsetsGeometry contentPadding;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  const CustomTextFormField({
    this.prefixIcon,
    this.onFieldSubmitted,
    this.textInputAction,
    super.key,
    this.focusNode,
    this.label,
    this.maxLength,
    this.contentPadding = const EdgeInsetsGeometry.all(14),
    this.textStyle,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.borderRadius = 0.0,
    this.obscuringCharacter,
    this.hintText,
    this.validator,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.floatingLabelBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue,
      style: textStyle,

      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        contentPadding: contentPadding,
        fillColor: fillColor,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          //   fontSize: 16.sp,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          // fontSize: 14.sp,
        ),
        suffixIcon: suffixIcon,
        floatingLabelBehavior: floatingLabelBehavior,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
