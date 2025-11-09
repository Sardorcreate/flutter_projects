import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/core/storage/notes_storage.dart';
import 'package:habit/screens/auth/forgot_password.dart';
import 'package:habit/screens/main_screen_elements/profile/screens/about_screen.dart';
import 'package:habit/screens/main_screen_elements/profile/widgets/profile_widgets.dart';
import 'package:habit/screens/onboarding.dart';
import 'package:habit/widgets/button_sized_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        leading: Icon(Icons.abc, color: AppColors.secondary),
        leadingWidth: 24,
        title: Text("Me",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 36
          ),
        ),
        toolbarHeight: height * 0.08,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 36, top: 20, bottom: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: height * 0.055,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text("John Doe", style: TextStyle(fontSize: 18, height: 1)),
                    Text("yourmail@gmail.com", style: TextStyle(fontSize: 18))
                  ],
                )
              ]
            ),
          ),
          Container(width: double.infinity, height: 1, color: Colors.black),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileWidgets.buildRow(Icons.mode_night, "Dark Mode"),
                SizedBox(height: 20),
                ProfileWidgets.buildRow(
                  Icons.lock, "Reset Password",
                  callback: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPassword())
                    );
                  }
                ),
                SizedBox(height: 20),
                ProfileWidgets.buildRow(
                  Icons.info, "About",
                  callback: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen())
                    );
                  }
                ),
                SizedBox(height: height * 0.037),
                ButtonSizedBox(
                  hasEmptyFields: false,
                  callback: () {
                    showDialog(context: context, builder: (BuildContext context) {
                      return ProfileWidgets.buildLogOutDialog(
                        context, height, width,
                        "Log out",
                        "Are you sure you want to log out?",
                        "Log out",
                        () {
                          Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(
                              builder: (context) => Onboarding()
                            ),
                            (route) => false
                          );
                          NotesLocalStorage.saveIsLoggedIn(false);
                        }
                      );
                    });
                  },
                  text: "LOG OUT",
                  icon: Icon(Icons.logout, color: AppColors.secondary, size: 36,),
                ),
              ],
            )
          )
        ]
      ),
    );
  }
}