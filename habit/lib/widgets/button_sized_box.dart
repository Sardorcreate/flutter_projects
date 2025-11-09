import 'package:flutter/material.dart';
import 'package:habit/core/constants/app_colors.dart';

class ButtonSizedBox extends StatelessWidget {
  const ButtonSizedBox({
    super.key,
    required this.hasEmptyFields,
    required this.callback,
    required this.text,
    this.icon,
  });

  final VoidCallback callback;
  final String text;
  final bool hasEmptyFields;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: icon != null
        ? ElevatedButton.icon(
            onPressed: callback,
            icon: Padding(padding: EdgeInsets.only(right: 10), child: icon!),
            label: Text(
              text,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: hasEmptyFields
                  ? AppColors.primary.withAlpha(190)
                  : AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          )
        : ElevatedButton(
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