import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFFFFB347);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF1F1F1);
  static const Color error = Color(0xFFDD6A57);
  static const Color input = Color(0x40000000);
  static const Color lightGray = Color(0xFF787878);
  static const Color orange = Color(0xFFFFB347);

  static const LinearGradient linear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [lightGray, orange],
    stops: [0.25, 0.75],
  );

}