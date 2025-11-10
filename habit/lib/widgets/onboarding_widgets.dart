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
              alignment: Alignment.topLeft,
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
              Navigator.pop(context);
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

  static Future<bool> buildExitDialog(BuildContext context, double height, double width) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: height * 0.047),
        child: Container(
          height: height * 0.2,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Exit App", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
              SizedBox(height: 18),
              Text("Are you sure you want to exit the app?", style: TextStyle(fontSize: 14)),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      foregroundColor: Colors.black,
                      minimumSize: Size(width * 0.328, height * 0.046),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.black12, width: 1),
                      ),
                    ),
                    child: Text("No", style: TextStyle(fontSize: 14)),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.secondary,
                      minimumSize: Size(width * 0.328, height * 0.046),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Exit",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondary
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ) ?? false;
  }
}