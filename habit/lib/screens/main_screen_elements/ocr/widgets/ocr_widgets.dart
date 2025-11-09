import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';

class OcrWidgets {

  static Widget buildContainer(double height, Widget? child) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: height * 0.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 1)
      ),
      child: child,
    );
  }

  static Widget buildButton(String text, Color color, double width, VoidCallback callback) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: color,
        maximumSize: Size(width * 0.3, 40),
        minimumSize: Size(width * 0.3, 40),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(color: color == AppColors.secondary ? Colors.black : Colors.transparent)
        ),
        elevation: color == AppColors.secondary ? 0 : 3,
      ),
      child: Text(text,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: color == AppColors.secondary ? Colors.black : AppColors.secondary,
              height: 1
          )
      ),
    );
  }

}