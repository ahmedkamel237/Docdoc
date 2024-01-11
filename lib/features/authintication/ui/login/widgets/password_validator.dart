import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        SizedBox(height: 2.h),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        SizedBox(height: 2.h),
        buildValidationRow(
            'At least 1 special character', hasSpecialCharacters),
        SizedBox(height: 2.h),
        buildValidationRow('At least 1 number', hasNumber),
        SizedBox(height: 2.h),
        buildValidationRow('At least 8 characters long', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColor.gray100,
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: AppTextStyle.font13BlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? AppColor.gray100 : AppColor.p100,
          ),
        )
      ],
    );
  }
}
