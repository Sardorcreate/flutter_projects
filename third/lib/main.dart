import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:third/category_item.dart';
import 'package:third/core/utils/colors.dart';
import 'package:third/core/utils/themes.dart';
import 'package:third/recipe_app_bar.dart';
import 'package:third/recipe_icon_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoriesView(),
      themeMode: ThemeMode.dark,
      darkTheme: AppThemes.darkTheme,
    );
  }
}

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.beigeColor,
      appBar: RecipeAppBar(title: "Categories"),
      body: ListView(
        padding: EdgeInsets.only(left: 36, right: 36),
        children: [
          CategoryItem(
            title: "Seafood",
            image: "assets/images/seafood.jpg",
            isMain: true,
          ),
          SizedBox(height: 16),
          GridView(
            padding: EdgeInsets.only(bottom: 100),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 172,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              childAspectRatio: 172 / 160,
              crossAxisSpacing: 39,
            ),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              CategoryItem(title: "Lunch", image: "assets/images/lunch.jpg"),
              CategoryItem(
                title: "Breakfast",
                image: "assets/images/breakfast.jpg",
              ),
              CategoryItem(title: "Dinner", image: "assets/images/dinner.png"),
              CategoryItem(title: "Vegan", image: "assets/images/vegan.jpg"),
              CategoryItem(
                title: "Dessert",
                image: "assets/images/dessert.jpg",
              ),
              CategoryItem(title: "Drinks", image: "assets/images/drinks.jpg"),
              CategoryItem(title: "Meat", image: "assets/images/meat.jpg"),
              CategoryItem(title: "Salads", image: "assets/images/salads.jpg"),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Align(
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
      ),
    );
  }
}