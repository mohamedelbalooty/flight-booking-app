import 'package:flight_booking_app/src/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    this.controller,
    this.padding,
    this.formKey,
    required this.children,
  });

  final ScrollController? controller;
  final EdgeInsets? padding;
  final GlobalKey<FormState>? formKey;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding: padding ?? AppSize.pHorizontal20,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
