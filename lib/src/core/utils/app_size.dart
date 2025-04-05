import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppSize {
  static const double s4 = 4.0;
  static const double s8 = 8.0;
  static const double s12 = 12.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s24 = 24.0;
  static const double s32 = 32.0;

  static const pAll4 = EdgeInsets.all(s4);
  static const pAll8 = EdgeInsets.all(s8);
  static const pAll12 = EdgeInsets.all(s12);
  static const pAll16 = EdgeInsets.all(s16);
  static const pAll18 = EdgeInsets.all(s18);
  static const pAll20 = EdgeInsets.all(s20);
  static const pAll24 = EdgeInsets.all(s24);
  static const pAll32 = EdgeInsets.all(s32);

  static const pHorizontal4 = EdgeInsets.symmetric(horizontal: s4);
  static const pHorizontal8 = EdgeInsets.symmetric(horizontal: s8);
  static const pHorizontal12 = EdgeInsets.symmetric(horizontal: s12);
  static const pHorizontal16 = EdgeInsets.symmetric(horizontal: s16);
  static const pHorizontal18 = EdgeInsets.symmetric(horizontal: s18);
  static const pHorizontal20 = EdgeInsets.symmetric(horizontal: s20);
  static const pHorizontal24 = EdgeInsets.symmetric(horizontal: s24);
  static const pHorizontal32 = EdgeInsets.symmetric(horizontal: s32);

  static const pVertical4 = EdgeInsets.symmetric(vertical: s4);
  static const pVertical8 = EdgeInsets.symmetric(vertical: s8);
  static const pVertical12 = EdgeInsets.symmetric(vertical: s12);
  static const pVertical16 = EdgeInsets.symmetric(vertical: s16);
  static const pVertical18 = EdgeInsets.symmetric(vertical: s18);
  static const pVertical20 = EdgeInsets.symmetric(vertical: s20);
  static const pVertical24 = EdgeInsets.symmetric(vertical: s24);
  static const pVertical32 = EdgeInsets.symmetric(vertical: s32);

  static const pOnlyBottom20 = EdgeInsets.only(bottom: s20);
  static const pSymmetricH20V12 = EdgeInsets.symmetric(
    horizontal: s20,
    vertical: s12,
  );

  static final hGap4 = SizedBox(width: s4.w);
  static final hGap8 = SizedBox(width: s8.w);
  static final hGap12 = SizedBox(width: s12.w);
  static final hGap16 = SizedBox(width: s16.h);
  static final hGap20 = SizedBox(width: s20.w);
  static final hGap24 = SizedBox(width: s24.w);
  static final hGap32 = SizedBox(width: s32.w);

  static final vGap4 = SizedBox(height: s4.h);
  static final vGap8 = SizedBox(height: s8.h);
  static final vGap12 = SizedBox(height: s12.h);
  static final vGap16 = SizedBox(height: s16.h);
  static final vGap20 = SizedBox(height: s20.h);
  static final vGap24 = SizedBox(height: s24.h);
  static final vGap32 = SizedBox(height: s32.h);
}
