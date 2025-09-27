import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:third/core/utils/colors.dart';
import 'package:third/recipe_icon_button.dart';
import 'package:third/recipe_icon_button_container.dart';

class RecipeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 72);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36),
      child: AppBar(
        toolbarHeight: 72,
        backgroundColor: AppColors.beigeColor,
        leading: Align(
          alignment: Alignment.centerLeft,
          child: RecipeIconButton(
            image: "assets/icons/arrow_back.svg",
            callback: () {},
            width: 25,
            height: 17,
            colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
          )
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconWidth: 17,
            iconHeight: 24,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconWidth: 12,
            iconHeight: 18,
            callback: () {},
          ),
        ],
      ),
    );
  }
}
