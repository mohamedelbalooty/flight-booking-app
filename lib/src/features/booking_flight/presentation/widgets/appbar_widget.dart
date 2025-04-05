import 'package:flight_booking_app/src/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget({
  String? title,
  Widget? leading,
  List<Widget>? actions,
  bool? centerTitle,
  double? toolbarHeight,
}) => AppBar(
  title: title != null ? Text(title) : null,
  flexibleSpace: Container(color: AppColors.appBarColor),
  leading: leading,
  actions: actions,
  centerTitle: centerTitle,
  toolbarHeight: toolbarHeight,
  automaticallyImplyLeading: true,
);
