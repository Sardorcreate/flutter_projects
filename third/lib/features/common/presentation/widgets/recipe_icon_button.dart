import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecipeIconButton extends StatelessWidget {
  const RecipeIconButton({
    super.key,
    required this.image,
    required this.callback,
    this.width = 28,
    this.height = 28,
    this.colorFilter = const ColorFilter.mode(Colors.white, BlendMode.srcIn),
  });
  
  final String image;
  final VoidCallback callback;
  final double width, height;
  final ColorFilter colorFilter;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: callback,
        icon: SvgPicture.asset(
          image,
          width: width,
          height: height,
          colorFilter: colorFilter,
        ),

      ),
    );
  }
}
