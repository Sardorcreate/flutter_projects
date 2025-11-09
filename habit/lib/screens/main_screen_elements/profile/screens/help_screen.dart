import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/auth/forgot_password.dart';
import 'package:habit/screens/main_screen.dart';
import 'package:habit/screens/main_screen_elements/profile/widgets/help_widgets.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.28,
            color: AppColors.primary,
            padding: EdgeInsets.only(left: height * 0.04, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Help", style: TextStyle(fontSize: 36)),
                SizedBox(height: height * 0.08),
                Padding(
                  padding: EdgeInsets.only(left: 12),
                  child: Text("User Guide",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w400,
                      color: AppColors.secondary,
                      height: 1
                    ),
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.05, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HelpWidgets.buildContainer(height,Icons.sticky_note_2_outlined,"Notes",
                  () {MainScreen.globalKey.currentState?.changeTab(0);}
                ),
                SizedBox(height: height * 0.03),
                HelpWidgets.buildContainer(height, Icons.image_search, "OCR",
                  () {MainScreen.globalKey.currentState?.changeTab(1);}
                ),
                SizedBox(height: height * 0.03),
                HelpWidgets.buildContainer(height, Icons.lock_outline, "Reset Password",
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword())
                    );
                  }
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}