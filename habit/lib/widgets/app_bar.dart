import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 72);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 74,
      backgroundColor: AppColors.background,
      leading: Padding(
        padding: EdgeInsets.only(left: 36),
        child: IconButton(
          splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back),
          iconSize: 24,
          color: AppColors.primary,
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      title: Container(
        margin: EdgeInsets.only(left: 24),
        child: Text(title, style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
