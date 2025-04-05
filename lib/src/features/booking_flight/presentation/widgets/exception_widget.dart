import 'package:easy_localization/easy_localization.dart';
import 'package:flight_booking_app/src/core/utils/app_assets.dart';
import 'package:flight_booking_app/src/core/utils/app_colors.dart';
import 'package:flight_booking_app/src/core/utils/app_size.dart';
import 'package:flight_booking_app/src/core/utils/app_styles.dart';
import 'package:flight_booking_app/src/features/booking_flight/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSize.pHorizontal20,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: AppStyles.errorStyle(),
              textAlign: TextAlign.center,
            ),
            AppSize.vGap24,
            Image.asset(AppAssets.serverError, height: 185.sp, width: 185.sp),
            AppSize.vGap32,
            Text(
              'error_message'.tr(),
              style: AppStyles.errorStyle(
                color: AppColors.grey400Color,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                height: 1.6,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            ButtonWidget(buttonTitle: 'retry'.tr(), onPressed: onRetry),
            AppSize.vGap12,
          ],
        ),
      ),
    );
  }
}

