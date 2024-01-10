import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
 
  const AppButtons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.maxFinite,
            50,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          AppColor.p100,
        ),
      ),
      onPressed: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 14.h),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyle.font16graySemiBold,
        ),
      ),
    );
  }

  static AppButtons primary(
      {required String title, required VoidCallback onTap,}) {
    return AppButtons(
      onTap: onTap,
      title: title,
    );
  }
}
