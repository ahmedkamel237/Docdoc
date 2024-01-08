import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingImageWithText extends StatelessWidget {
  const OnBoardingImageWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          Assets.imagesLogoBackground,
        ),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const [.14, .4],
            ),
          ),
          child: Image.asset(
            Assets.imagesOnboarding,
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            "Best Doctor Appointment App",
            textAlign: TextAlign.center,
            style: AppTextStyle.font32blueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}
