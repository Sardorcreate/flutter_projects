import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/screens/auth/login_screen.dart';
import 'package:habit/widgets/app_bar.dart';
import 'package:habit/widgets/auth_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool showErrors = false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_updateState);
    emailController.addListener(_updateState);
    passwordController.addListener(_updateState);
    confirmPasswordController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
  }

  void _createAccount() {
    setState(() {
      showErrors = true;
    });

    bool hasEmptyFields =
        nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty;

    if (hasEmptyFields) {
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Account created successfully!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBarWidget(title: "Create Account"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's get to know you !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              "Enter your details to continue",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),

            AuthWidgets.buildNameField(nameController, showErrors),
            SizedBox(height: height * 0.03),
            AuthWidgets.buildEmailField(emailController, showErrors),
            SizedBox(height: height * 0.03),
            AuthWidgets.buildPasswordField(
              passwordController,
              showErrors,
              obscurePassword,
              _togglePasswordVisibility,
            ),
            SizedBox(height: height * 0.03),
            AuthWidgets.buildConfirmPasswordField(
              confirmPasswordController,
              showErrors,
              obscurePassword,
            ),

            SizedBox(height: height * 0.03),

            Text("Already have an account ?", style: TextStyle(fontSize: 18)),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                "Login here",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),

            SizedBox(height: height * 0.07),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By clicking the "CREATE ACCOUNT" button, you agree to ',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextSpan(
                    text: 'Terms of use',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: ' and ', style: TextStyle(fontSize: 18)),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: height * 0.01),

            AuthWidgets.buildCreateAccountButton(
              nameController,
              emailController,
              passwordController,
              confirmPasswordController,
              _createAccount,
              'CREATE ACCOUNT'
            ),
          ],
        ),
      ),
    );
  }
}
