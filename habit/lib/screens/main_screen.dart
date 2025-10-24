import 'package:flutter/material.dart';
import 'package:habit/screens/main_screen_elements/help_screen.dart';
import 'package:habit/screens/main_screen_elements/notes/notes_screen.dart';
import 'package:habit/screens/main_screen_elements/ocr_screen.dart';
import 'package:habit/screens/main_screen_elements/profile_screen.dart';

import '../core/constants/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void changeTab(int index) {
    if (mounted) {
      setState(() => _selectedIndex = index);
    }
  }

  final List<Widget> _screens = [
    NotesScreen(),
    OcrScreen(),
    HelpScreen(),
    ProfileScreen(),
  ];

  final List<IconData> _icon = [
    Icons.sticky_note_2_outlined,
    Icons.image_search,
    Icons.help_outline,
    Icons.person_outline,
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onTabSelected(int index) {
    if (_selectedIndex != index) {
      setState(() => _selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    final List<String> labels = [
      'Notes',
      'OCR',
      'Help',
      'Me',
    ];
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        height: height * 0.1,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Row(
            children: [
              _navItem(index: 0, asset: _icon[0], label: labels[0]),
              _navItem(index: 1, asset: _icon[1], label: labels[1]),
              _navItem(index: 2, asset: _icon[2], label: labels[2]),
              _navItem(index: 3, asset: _icon[3], label: labels[3]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required int index,
    required IconData asset,
    required String label,
  }) {
    return Expanded(
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () => _onTabSelected(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(asset, size: 36),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18
              )
            ),
          ],
        ),
      ),
    );
  }
}