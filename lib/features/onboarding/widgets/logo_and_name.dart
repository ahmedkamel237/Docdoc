import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAndHomeHeader extends StatelessWidget {
  const LogoAndHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesLogo,
          width: 40,
          height: 40,
        ),
        SizedBox(width: 8.w),
        Text(
          "Docdoc",
          style: AppTextStyle.font24black700wight,
        ),
      ],
    );
  }
}
