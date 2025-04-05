import 'package:flight_booking_app/src/core/utils/app_colors.dart';
import 'package:flight_booking_app/src/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    this.backgroundColor,
    this.titleColor,
  });

  final VoidCallback onPressed;
  final String buttonTitle;
  final Color? backgroundColor, titleColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? AppColors.secondaryColor,
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        fixedSize: WidgetStateProperty.all(Size(double.maxFinite, 48.h)),
      ),
      child: Text(buttonTitle, style: AppStyles.buttonStyle(color: titleColor)),
    );
  }
}
