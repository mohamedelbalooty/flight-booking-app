import "package:flight_booking_app/src/core/utils/app_assets.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "app_colors.dart";

abstract class AppStyles {
  static TextStyle inputStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.blackColor,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.4,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle hintStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.grey400Color,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.4,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle labelStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.blackColor,
    fontSize: fontSize ?? 16.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.4,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle buttonStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.whiteColor,
    fontSize: fontSize ?? 16.sp,
    fontWeight: fontWeight ?? FontWeight.w600,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.5,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle appbarTitleStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.whiteColor,
    fontSize: fontSize ?? 20.sp,
    fontWeight: fontWeight ?? FontWeight.w600,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.5,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle primaryStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.primaryColor,
    fontSize: fontSize ?? 16.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.5,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle errorStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
    double? height,
  }) => TextStyle(
    color: color ?? AppColors.errorColor,
    fontSize: fontSize ?? 14.sp,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontFamily: fontFamily ?? AppAssets.cairoFontFamily,
    height: height ?? 1.5,
    overflow: TextOverflow.ellipsis,
  );
}
