import 'package:flutter/material.dart';
import 'package:third/core/utils/colors.dart';
import 'package:third/features/categories/presentation/widgets/category_item.dart';

import '../../../common/common.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: RecipeAppBar(title: "Categories"),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            sliver: SliverToBoxAdapter(
              child: CategoryItem(
                title: "Seafood",
                image: "assets/images/seafood.jpg",
                isMain: true,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 36,
              right: 36,
              top: 16,
              bottom: 100,
            ),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                CategoryItem(title: "Lunch", image: "assets/images/lunch.jpg"),
                CategoryItem(
                  title: "Breakfast",
                  image: "assets/images/breakfast.jpg",
                ),
                CategoryItem(
                  title: "Dinner",
                  image: "assets/images/dinner.png",
                ),
                CategoryItem(title: "Vegan", image: "assets/images/vegan.jpg"),
                CategoryItem(
                  title: "Dessert",
                  image: "assets/images/dessert.jpg",
                ),
                CategoryItem(
                  title: "Drinks",
                  image: "assets/images/drinks.jpg",
                ),
                CategoryItem(title: "Meat", image: "assets/images/meat.jpg"),
                CategoryItem(
                  title: "Salads",
                  image: "assets/images/salads.jpg",
                ),
              ]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 172,
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                childAspectRatio: 172 / 160,
                crossAxisSpacing: 39,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}