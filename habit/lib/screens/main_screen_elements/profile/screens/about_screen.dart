import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/widgets/app_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBarWidget(title: "About", background: AppColors.primary, iconColor: Colors.black),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height * 0.2,
            color: AppColors.primary,
            child: Image.asset("assets/images/logo_no_name.png"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.067, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Application", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Text("HaBIT Note", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Version", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Text("V1.0.0", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  ],
                ),
                SizedBox(height: 15),
                Text("Privacy Policy", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                SizedBox(height: 15),
                Text("Terms of Use", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            )
          ),
        ],
      ),
    );
  }
}
