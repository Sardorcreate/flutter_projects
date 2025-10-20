import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/auth/forgot_password.dart';
import 'package:habit/screens/auth/login_screen.dart';
import 'package:habit/screens/auth/signup_screen.dart';
import 'package:habit/screens/onboarding.dart';

class OnboardingWidgets {

  static Widget buildPageContent(OnboardingPage page) {
    return Container(
      width: 348,
      decoration: BoxDecoration(
          color: Colors.transparent
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(page.svgAsset),
          SizedBox(height: 4),
          Text(
            page.title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700
            ),
          ),
          Text(
            page.description,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildPageIndicators(double width,
      int currentPage,
      List<OnboardingPage> pages,
      PageController pageController, ) {
    return Container(
      height: 16,
      width: width * 0.44,
      decoration: BoxDecoration(
          color: Colors.transparent
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(pages.length, (index) {
          return InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 50),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: currentPage == index
                  ? 65 : 35,
              height: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: currentPage == index
                    ? AppColors.primary
                    : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }

  static Widget buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 343,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: Text(
              "CREATE ACCOUNT",
              style: TextStyle(
                  fontSize: 18,
                  color: AppColors.secondary
              ),
            ),
          ),
        ),
        SizedBox(height: 25),
        SizedBox(
          width: 343,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary
            ),
            child: Text(
              "LOG IN",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget buildHeader(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(top: 36, left: 36, right: 64, bottom: 15),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.topLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.menu, color: AppColors.primary,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HaBIT Note",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Fugaz One'
                    ),
                  ),
                  SizedBox(height: 8,),
                  Text("V1.0.0",
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget buildNavigationItems(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 52, vertical: 20),
        children: [
          ListTile(title: Text("Forgot Password", style: TextStyle(fontSize: 18),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ForgotPassword()),
              );
            },
          ),
          ListTile(title: Text("Privacy Policy", style: TextStyle(fontSize: 18),),
            onTap: () {Navigator.pop(context);},
          ),
          ListTile(title: Text("Terms of Use", style: TextStyle(fontSize: 18),),
            onTap: () {Navigator.pop(context);},
          ),
        ],
      ),
    );
  }
}