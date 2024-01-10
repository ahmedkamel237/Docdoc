import 'package:doctor/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static TextStyle font24black700wight = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle font10black500wight = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );


  static TextStyle font32blueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.p100,
  );
  static TextStyle font24blueBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColor.p100,
  );
  static TextStyle font12blueMedium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColor.p100,
  );

  static TextStyle font13grayRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.gray70,
  );

  static TextStyle font11grayRegular = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.gray60,
  );
  static TextStyle font16graySemiBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.white,
  );
}
