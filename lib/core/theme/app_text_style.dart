import 'package:flutter/material.dart';

import 'app_colors.dart';


class AppTextStyle{

  static const TextStyle appHeading= TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
  );

  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // 💬 Body Text
  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // 🧾 Caption / Label
  static const TextStyle caption = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  // 🟡 Highlighted Text (Accent)
  static const TextStyle accent = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.accentOrange,
  );

}