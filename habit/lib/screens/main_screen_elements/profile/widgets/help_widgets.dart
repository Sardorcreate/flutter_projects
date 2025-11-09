import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';

class HelpWidgets {

  static Widget buildContainer(double height, IconData icon, String title, VoidCallback? callback) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        height: height * 0.11,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, size: 60, color: AppColors.secondary),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                Text("Tap to view", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, height: 1))
              ],
            )
          ],
        ),
      ),
    );
  }

}