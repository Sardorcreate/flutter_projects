import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/main_screen.dart';
import 'package:habit/screens/onboarding.dart';

import '../core/storage/notes_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    isLoggedIn();
    super.initState();
  }
  isLoggedIn() async {
    final isLoggedIn = await NotesLocalStorage.getIsLoggedIn();
    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => isLoggedIn == true ? MainScreen(key: MainScreen.globalKey) : Onboarding())
      );
    });
  }
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.22),
              Image(image: AssetImage("assets/images/logo.png")),
              SizedBox(height: screenHeight * 0.4,),
              Text(
                "© Copyright HABIT 2021. All rights reserved",
                style: TextStyle(
                  fontSize: 14,
                  height: 1
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ),
    );
  }
}