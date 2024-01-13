import 'package:doctor/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAndSubTitleHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleAndSubTitleHeader(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50.h),
        Text(
          title,
          style: AppTextStyle.font24blueBold,
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: AppTextStyle.font13grayRegular.copyWith(
            height: 1.8,
            fontSize: 14,
            letterSpacing: 0.20,
          ),
        ),
      ],
    );
  }
}
