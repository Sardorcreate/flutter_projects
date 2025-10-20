import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/widgets/onboarding_widgets.dart';

class Onboarding extends StatefulWidget {
  const Onboarding ({super.key});

  @override
  State<Onboarding> createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<Onboarding> {
  final PageController pageController = PageController();
  int currentPage = 0;

  final List<OnboardingPage> pages = [
    OnboardingPage(
      title: "Take Notes",
      description: "Quickly capture what's on your mind",
      svgAsset: "assets/images/amico.svg",
    ),
    OnboardingPage(
      title: "To-dos",
      description: "List out your day-to-day tasks",
      svgAsset: "assets/images/cuate.svg",
    ),
    OnboardingPage(
      title: "Image to Text Converter",
      description: "Upload your images and convert to text",
      svgAsset: "assets/images/amico2.svg",
    ),
  ];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 74,
        backgroundColor: AppColors.background,
        leading:  Builder(
          builder: (context) => Container(
            margin: EdgeInsets.only(left: 36.0, top: 14, bottom: 36),
            child: IconButton(
              splashColor: Colors.transparent,
              icon: Icon(Icons.menu),
              iconSize: 24,
              color: AppColors.primary,
              padding: EdgeInsets.zero,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 3),
              SizedBox(
                width: width * 0.81,
                height: height * 0.06,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WELCOME TO",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      "HaBIT Note",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Fugaz One'
                      ),
                    ),
                  ],
                )
              ),
              SizedBox(height: 28),
              // Page View for onboarding content
              SizedBox(
                height: height * 0.5,
                child: SafeArea(
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: pages.length,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      return OnboardingWidgets.buildPageContent(pages[index]);
                    },
                  ),
                ),
              ),
              OnboardingWidgets.buildPageIndicators(width, currentPage, pages, pageController),
              SizedBox(height: 39,),
              OnboardingWidgets.buildActionButtons(context),
            ],
          ),
        ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppColors.linear
          ),
          child: Column(
            children: [
              OnboardingWidgets.buildHeader(context),
              Container(width: double.infinity, height: 1, color: Colors.black,),
              OnboardingWidgets.buildNavigationItems(context),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String svgAsset;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.svgAsset,
  });
}