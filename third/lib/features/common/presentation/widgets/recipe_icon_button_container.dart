import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:third/core/utils/colors.dart';

class RecipeIconButtonContainer extends StatelessWidget {
  const RecipeIconButtonContainer({
    super.key,
    required this.image,
    required this.callback,
    this.containerHeight = 28,
    this.containerWidth = 28,
    required this.iconHeight,
    required this.iconWidth,

  });

  final String image;
  final VoidCallback callback;
  final double containerWidth, containerHeight;
  final double iconWidth, iconHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(containerWidth / 2)
      ),
      child: IconButton(
        onPressed: callback,
        padding: EdgeInsets.zero,
        icon: SvgPicture.asset(
            image,
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.cover
        ),
      ),
    );
  }
}
