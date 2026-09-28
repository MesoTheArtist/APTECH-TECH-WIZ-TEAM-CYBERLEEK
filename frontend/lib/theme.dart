import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0E6D68);
  static const darkTeal = Color(0xFF0A4440);
  static const yellow = Color(0xFFFFC93D);
  static const bg = Color(0xFFF8FBF9);
  static const inputBg = Color(0xFFFFFFFF);
  static const greyText = Color(0xFF8A9A9A);
}

final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.bg,
  fontFamily: 'Inter',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    ),
  ),
);