import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/widgets/app_bar.dart';
import 'package:habit/widgets/auth_widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  TextEditingController emailController = TextEditingController();

  bool showErrors = false;

  @override
  @override
  void initState() {
    emailController.addListener(_updateState);
    super.initState();
  }

  void submit() {
    setState(() {
      showErrors = true;
    });

    bool hasEmptyFields = emailController.text.isEmpty;

    if (hasEmptyFields) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("You submitted successfully !"),
          backgroundColor: Colors.green,
        )
    );
  }

  void _updateState() {
    setState(() {
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(title: "Forgot Password"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Please enter your account's email address and we will send you a link to reset your password",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: height * 0.08,),

            AuthWidgets.buildEmailField(emailController, showErrors),
            SizedBox(height: height * 0.4),

            AuthWidgets.buildSubmitButton(emailController, submit, 'SUBMIT')
          ],
        ),
      ),
    );
  }
}
