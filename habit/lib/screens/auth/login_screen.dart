import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/auth/forgot_password.dart';
import 'package:habit/screens/auth/signup_screen.dart';
import 'package:habit/screens/main_screen.dart';
import 'package:habit/widgets/app_bar.dart';
import 'package:habit/widgets/auth_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;
  bool showErrors = false;

  void _togglePasswordVisibility() {
      setState(() {
        obscurePassword = !obscurePassword;
      });
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(_updateState);
    passwordController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {
    });
  }

  void login() {
    setState(() {
      showErrors = true;
    });

    bool hasEmptyFields =
            emailController.text.isEmpty ||
            passwordController.text.isEmpty;

    if (hasEmptyFields) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(title: "Login"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Welcome back !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Please login with your credentials",
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: height * 0.11),

            AuthWidgets.buildEmailField(emailController, showErrors),
            SizedBox(height: height * 0.03),
            AuthWidgets.buildPasswordField(passwordController, showErrors, obscurePassword, _togglePasswordVisibility),
            SizedBox(height: height * 0.01),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPassword()),
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textAlign: TextAlign.end,
                  "Forgot password ?",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: height * 0.07),

            Text("Don't have an account yet ?", style: TextStyle(fontSize: 18)),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>SignUp()),
                );
              },
              child: Text(
                "Create an account here",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),

            SizedBox(height: height * 0.14),

            AuthWidgets.buildLoginButton(emailController, passwordController, login, 'LOG IN')
          ],
        ),
      ),
    );
  }
}
