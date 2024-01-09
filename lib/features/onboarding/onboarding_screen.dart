import 'package:doctor/core/helpers/extentions.dart';
import 'package:doctor/core/routing/routs.dart';
import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/widgets/app_buttons.dart';
import 'package:doctor/features/onboarding/widgets/logo_and_name.dart';
import 'package:doctor/features/onboarding/widgets/onboarding_image_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                top: 30.h,
                bottom: 30.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: LogoAndHomeHeader(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const OnBoardingImageWithText(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      children: [
                        Text(
                          "Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                          style: AppTextStyle.font13grayRegular,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        AppButtons.primary(
                          title: "Get Started",
                          onTap: () {
                            context.pushReplacementNamed(Routes.loginScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
