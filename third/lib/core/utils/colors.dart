import 'package:flutter/material.dart';

class AppColors{
  static const redPinkMain = Color(0xfffd5d69);
  static const beigeColor = Color(0xFF1C0F0D);
  static const pinkSub = Color(0xffec888d);
  static const pink = Color(0xffffc6c9);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.redPinkMain,
    onPrimary: Colors.white,
    secondary: AppColors.pink,
    onSecondary: AppColors.pinkSub,
    error: Colors.red,
    onError: Colors.white,
    surface: AppColors.beigeColor,
    onSurface: Colors.white,
  );
}