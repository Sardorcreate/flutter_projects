import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    Future.delayed(Duration(seconds: 2),() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding())
      );
    });

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