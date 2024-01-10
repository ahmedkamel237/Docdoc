import 'package:doctor/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
          text: "Already have account yet ? ",
          style: AppTextStyle.font10black500wight,
        ),
        TextSpan(text: "Sign up", style: AppTextStyle.font12blueMedium),
      ]),
    );
  }
}
