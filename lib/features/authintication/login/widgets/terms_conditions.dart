import 'package:doctor/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "By Logging, you agree to our ",
          style: AppTextStyle.font11grayRegular,
        ),
        TextSpan(
          text: "Terms and Conditions",
          style: AppTextStyle.font10black500wight,
        ),
        TextSpan(
          text: " and ",
          style: AppTextStyle.font11grayRegular,
        ),
        TextSpan(
          style: AppTextStyle.font10black500wight,
          text: "PrivacyPolicy.",
        ),
      ]),
    );
  }
}
