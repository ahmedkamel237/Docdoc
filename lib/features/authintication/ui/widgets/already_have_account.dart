import 'package:doctor/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccount extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final VoidCallback buttonTab;

  const AlreadyHaveAccount(
      {super.key,
      required this.title,
      required this.buttonTitle,
      required this.buttonTab});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyle.font10black500wight,
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: buttonTab,
              child: SizedBox(
                width: 8.w,
              ),
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              onTap: buttonTab,
              child: Text(
                buttonTitle,
                style: AppTextStyle.font12blueMedium.copyWith(fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
