import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit/core/constants/app_colors.dart';

class NotesWidgets {
  
  static Widget emptyScreen() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/rafiki.svg"),
            SizedBox(height: 20),
            Text("Create your first note !",
                style: TextStyle(
                  fontSize: 20,
                )
            )
          ]
      ),
    );
  }
  
  static Widget buildGridView(){
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Text("Kim kim kim"),
        Text("Kim kim kim"),
        Text("Kim kim kim"),
        Text("Kim kim kim"),
      ],
    );
  }
  
  static Widget buildDialog(double height){
    
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(29),
        height: height * 0.54,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Filter by colour", style: TextStyle(fontSize: 24)),
            SizedBox(height: height * 0.04),
            _buildContainerWBorder(Text("Reset", style: TextStyle(fontSize: 18))),
            SizedBox(height: height * 0.03),
            Expanded(
              child: GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: height * 0.03,
                      childAspectRatio: 2.5
                  ),
                  children: [
                    _buildContainerWBorder(Container()),
                    _buildContainer(AppColors.colour1),
                    _buildContainer(AppColors.primary),
                    _buildContainer(AppColors.colour2),
                    _buildContainer(AppColors.colour3),
                    _buildContainer(AppColors.colour4),
                    _buildContainer(AppColors.colour5),
                    _buildContainer(AppColors.colour6),
                    _buildContainer(AppColors.colour7),
                    _buildContainer(AppColors.colour8),
                    _buildContainer(AppColors.background),
                    _buildContainer(AppColors.colour10),
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildDialog2(double height) {
    return Dialog(
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: height * 0.05, vertical: 10),
          height: height * 0.18,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Text("New", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500))),
                InkWell(
                  onTap: (){},
                  child: Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.keyboard, size: 36),
                        Text("Add note", style: TextStyle(fontSize: 18),)
                      ]
                  ),
                ),
                SizedBox(height: height * 0.01),
                InkWell(
                  onTap: (){},
                  child: Row(
                      spacing: 20,
                      children: [
                        Icon(Icons.check_box, size: 36,),
                        Text("Add to-do", style: TextStyle(fontSize: 18),)
                      ]
                  ),
                )
              ]
          ),
        )
    );
  }

  static Widget _buildContainer(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  static Widget _buildContainerWBorder(Widget child) {
    return Container(
      alignment: Alignment.center,
      width: 96,
      height: 38,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: child,
    );
  }
  
}