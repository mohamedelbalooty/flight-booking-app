import 'package:flight_booking_app/src/core/utils/app_colors.dart';
import 'package:flight_booking_app/src/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputWidget extends StatelessWidget {
  const TextInputWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.controller,
    this.focusNode,
    this.onValidate,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.maxLines,
    this.enabled,
    this.readOnly,
    this.keyboardType,
  });

  final String label, hint;
  final IconData icon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? onValidate;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final int? maxLines;
  final bool? enabled;
  final bool? readOnly;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.labelStyle()),
        SizedBox(height: 6.h),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: onValidate,
          onTap: onTap,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          cursorColor: Theme.of(context).primaryColor,
          style: AppStyles.inputStyle(),
          keyboardType: keyboardType ?? TextInputType.text,
          maxLines: maxLines ?? 1,
          readOnly: readOnly ?? false,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: Icon(
              icon,
              color: AppColors.secondaryColor,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
