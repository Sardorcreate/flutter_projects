import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:third/core/utils/themes.dart';
import 'package:third/features/categories/presentation/pages/categories_view.dart';

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