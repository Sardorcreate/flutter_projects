import 'package:flutter/material.dart';
import 'package:third/core/utils/colors.dart';
import 'package:third/features/common/presentation/widgets/recipe_icon_button.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.beigeColor, Colors.transparent],
                begin: AlignmentGeometry.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 36),
            child: Container(
              width: 280,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.redPinkMain,
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecipeIconButton(
                    image: "assets/icons/house.svg",
                    callback: () {},
                  ),
                  RecipeIconButton(
                    image: "assets/icons/community.svg",
                    callback: () {},
                    width: 32,
                    height: 32,
                  ),
                  RecipeIconButton(
                    image: "assets/icons/category.svg",
                    callback: () {},
                    width: 35,
                    height: 35,
                  ),
                  RecipeIconButton(
                    image: "assets/icons/profile.svg",
                    callback: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
