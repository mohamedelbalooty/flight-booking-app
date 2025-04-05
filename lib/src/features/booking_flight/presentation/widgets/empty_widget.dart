import 'package:easy_localization/easy_localization.dart';
import 'package:flight_booking_app/src/core/utils/app_assets.dart';
import 'package:flight_booking_app/src/core/utils/app_colors.dart';
import 'package:flight_booking_app/src/core/utils/app_size.dart';
import 'package:flight_booking_app/src/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

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
            Image.asset(AppAssets.emptyData, height: 185.sp, width: 185.sp),
            AppSize.vGap32,
            Text(
              'empty_message'.tr(),
              style: AppStyles.primaryStyle(
                fontWeight: FontWeight.w700,
                height: 1.6,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            AppSize.vGap8,
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
            AppSize.vGap12,
          ],
        ),
      ),
    );
  }
}
