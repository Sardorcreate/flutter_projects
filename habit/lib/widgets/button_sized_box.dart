import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';

class ButtonSizedBox extends StatelessWidget {
  const ButtonSizedBox({
    super.key,
    required this.hasEmptyFields,
    required this.callback,
    required this.text
  });

  final VoidCallback callback;
  final String text;
  final bool hasEmptyFields;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          backgroundColor: hasEmptyFields
              ? AppColors.primary.withAlpha(190)
              : AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
