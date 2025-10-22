import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
    this.isMain = false,
  });

  final String title, image;
  final bool isMain;

  @override
  Widget build(BuildContext context) {

    final categoryTitle = Text(
      title,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );

    final categoryImage = ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(13),
      child: Image.asset(
        image,
        width: isMain ? 356 : 160,
        height: isMain ? 150 : 145,
        fit: BoxFit.cover,
      ),
    );

    return Center(
      child: GestureDetector(
        onTap: (){},
        child: Column(
          spacing: isMain ? 3 : 6,
          children: [
            isMain ? categoryTitle : categoryImage,
            isMain ? categoryImage : categoryTitle,
          ],
        ),
      ),
    );
  }
}
