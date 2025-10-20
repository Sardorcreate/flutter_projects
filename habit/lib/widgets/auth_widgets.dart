import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';
import 'package:habit/widgets/button_sized_box.dart';

class AuthWidgets {
  static Widget buildNameField(
    TextEditingController nameController,
    bool showErrors,
  ) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: showErrors && nameController.text.isEmpty
            ? 'Please enter your display name'
            : 'Display Name',
        hintStyle: TextStyle(
          color: showErrors && nameController.text.isEmpty
              ? AppColors.error
              : AppColors.input,
        ),
        filled: true,
        fillColor: AppColors.secondary,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person_outline, color: AppColors.primary),
      ),
    );
  }

  static Widget buildEmailField(
    TextEditingController emailController,
    bool showErrors,
  ) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: showErrors && emailController.text.isEmpty
            ? 'Please enter your email'
            : 'Email Address',
        hintStyle: TextStyle(
          color: showErrors && emailController.text.isEmpty
              ? AppColors.error
              : AppColors.input,
        ),
        filled: true,
        fillColor: AppColors.secondary,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.mail_outline, color: AppColors.primary),
      ),
    );
  }

  static Widget buildPasswordField(
    TextEditingController passwordController,
    bool showErrors,
    bool obscurePassword,
    VoidCallback onToggle,
  ) {
    return TextFormField(
      controller: passwordController,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        hintText: showErrors && passwordController.text.isEmpty
            ? 'Require at least 6 characters'
            : 'Password',
        hintStyle: TextStyle(
          color: showErrors && passwordController.text.isEmpty
              ? AppColors.error
              : AppColors.input,
        ),
        filled: true,
        fillColor: AppColors.secondary,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock_outline, color: AppColors.primary),
        suffixIcon: IconButton(
          splashColor: Colors.transparent,
          icon: Icon(
            obscurePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
            color: Colors.grey,
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }

  static Widget buildConfirmPasswordField(
    TextEditingController confirmPasswordController,
    bool showErrors,
    bool obscurePassword,
  ) {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        hintText: showErrors && confirmPasswordController.text.isEmpty
            ? 'Empty'
            : 'Confirm Password',
        hintStyle: TextStyle(
          color: showErrors && confirmPasswordController.text.isEmpty
              ? AppColors.error
              : AppColors.input,
        ),
        filled: true,
        fillColor: AppColors.secondary,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.anchor, color: AppColors.secondary),
      ),
    );
  }

  static Widget buildCreateAccountButton(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    TextEditingController confirmPasswordController,
    VoidCallback createAccount,
    String text
  ) {
    bool hasEmptyFields =
        nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty;

    return ButtonSizedBox(
      hasEmptyFields: hasEmptyFields,
      callback: createAccount,
      text: text,
    );
  }

  static Widget buildLoginButton(
      TextEditingController emailController,
      TextEditingController passwordController,
      VoidCallback login,
      String text,
  ) {
    bool hasEmptyFields =
        emailController.text.isEmpty ||
        passwordController.text.isEmpty;

    return ButtonSizedBox(hasEmptyFields: hasEmptyFields, callback: login, text: text);
  }

  static Widget buildSubmitButton(
      TextEditingController emailController,
      VoidCallback callback,
      String text
      ) {
    bool hasEmptyFields = emailController.text.isEmpty;

    return ButtonSizedBox(hasEmptyFields: hasEmptyFields, callback: callback, text: text);
  }
}
