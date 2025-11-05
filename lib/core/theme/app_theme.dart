import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.accentOrange,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: AppTextStyle.heading2,
    ),
    textTheme: const TextTheme(
      bodyLarge: AppTextStyle.body,
      bodyMedium: AppTextStyle.body,
      titleLarge: AppTextStyle.heading2,
      labelSmall: AppTextStyle.small,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: AppTextStyle.caption,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentOrange),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentOrange,
        foregroundColor: AppColors.textPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextStyle.bodyBold,
      ),
    ),
    cardColor: AppColors.surface,
  );
}
