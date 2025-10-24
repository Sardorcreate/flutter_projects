import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFFFFB347);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF1F1F1);
  static const Color error = Color(0xFFDD6A57);
  static const Color input = Color(0x40000000);

  static const Color colour1 = Color(0xFFFF9E9E);
  static const Color colour10 = Color(0xFFC4C4C4);
  static const Color colour2 = Color(0xFFFFF599);
  static const Color colour3 = Color(0xFF91F48F);
  static const Color colour4 = Color(0xFF9EFFFF);
  static const Color colour5 = Color(0xFFFD99FF);
  static const Color colour6 = Color(0xFFB69CFF);
  static const Color colour7 = Color(0xFF624AF2);
  static const Color colour8 = Color(0xFFFCDDEC);

  static const Color lightGray = Color(0xFF787878);
  static const Color orange = Color(0xFFFFB347);

  static const LinearGradient linear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [lightGray, orange],
    stops: [0.25, 0.75],
  );

}