import "package:flight_booking_app/src/core/utils/app_assets.dart";
import "package:flight_booking_app/src/core/utils/app_colors.dart";
import "package:flight_booking_app/src/core/utils/app_styles.dart";
import "package:flutter/material.dart";

abstract class AppTheme {
  static ThemeData appTheme = ThemeData(
    fontFamily: AppAssets.cairoFontFamily,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    appBarTheme: AppBarTheme(
      elevation: 4,
      centerTitle: true,
      backgroundColor: AppColors.appBarColor,
      foregroundColor: AppColors.appBarColor,
      titleTextStyle: AppStyles.appbarTitleStyle(),
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.whiteColor,
      hintStyle: AppStyles.hintStyle(),
      labelStyle: AppStyles.labelStyle(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.grey400Color),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.grey400Color),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.secondaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.errorColor),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.errorColor,
    ),
  );
}
