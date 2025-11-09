import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';

class ProfileWidgets {

  static Widget buildRow(IconData icon, String text, {callback}) {
    return GestureDetector(
      onTap: callback,
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black),
          SizedBox(width: 25),
          Text(text, style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }

  static Widget buildLogOutDialog(
      BuildContext context,
      double height,
      double width,
      String title,
      String body,
      String text,
      VoidCallback callback
  ) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: height * 0.047),
      child: Container(
        height: height * 0.2,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(height: 18),
            Text(body, style: TextStyle(fontSize: 14)),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {Navigator.pop(context);},
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: Colors.black,
                    minimumSize: Size(width * 0.328, height * 0.046),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.black12, width: 1),
                    ),
                  ),
                  child: Text("No", style: TextStyle(fontSize: 14)),
                ),
                TextButton(
                  onPressed: callback,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.secondary,
                    minimumSize: Size(width * 0.328, height * 0.046),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(text,
                    style: TextStyle(
                        fontSize: 14,
                        color: AppColors.secondary
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}