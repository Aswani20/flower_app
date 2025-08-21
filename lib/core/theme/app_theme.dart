import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData getTheme({
    required ColorScheme colorScheme,
    required Color textFormFieldBorderColor,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
      ),
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(
            selectedItemColor: AppColors.pink,
            unselectedItemColor: AppColors.grey,
            elevation: 0,
          ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(18),
          backgroundColor: AppColors.pink,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.grey,
          disabledForegroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: textFormFieldBorderColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: textFormFieldBorderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1,
          ),
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: EdgeInsets.all(16),
          disabledBackgroundColor: AppColors.grey,
          backgroundColor: colorScheme.primary,
          foregroundColor: AppColors.white,
          disabledForegroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  static ThemeData lightTheme = getTheme(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.pink,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.pink,
    ),
    textFormFieldBorderColor: AppColors.grey,
  );
}
