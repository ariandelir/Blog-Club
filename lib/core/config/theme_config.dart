import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.kPrimaryColor,
      onPrimary: AppColors.kOnPrimaryColor,
      onSurface: AppColors.kPrimaryTextColor,
      surface: AppColors.kSurfaceColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all(
          TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: FontFamily.avenir,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleSpacing: 32,
      backgroundColor: AppColors.kAppbarBackgroundColor,
      foregroundColor: AppColors.kPrimaryTextColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontFamily: FontFamily.avenir,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.kPrimaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: FontFamily.avenir,
        fontSize: 14,
        color: AppColors.kPrimaryTextColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: FontFamily.avenir,
        fontSize: 20,
        color: AppColors.kPrimaryTextColor,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: const TextStyle(
        fontFamily: FontFamily.avenir,
        fontWeight: FontWeight.w700,
        color: Color(0xff7B8BB2),
        fontSize: 10,
      ),
      headlineMedium: TextStyle(
        fontFamily: FontFamily.avenir,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryTextColor,
      ),
      titleLarge: TextStyle(
        fontFamily: FontFamily.avenir,
        fontWeight: FontWeight.bold,
        color: AppColors.kPrimaryTextColor,
        fontSize: 18,
      ),
      bodyMedium: TextStyle(
        fontFamily: FontFamily.avenir,
        color: AppColors.kViewedStoryColor,
        fontSize: 12,
      ),
      titleMedium: TextStyle(
        fontFamily: FontFamily.avenir,
        fontSize: 18,
        color: AppColors.kViewedStoryColor,
      ),
    ),
  );
}