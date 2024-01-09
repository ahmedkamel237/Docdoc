import 'package:doctor/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFields extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyBoardType;
  final void Function(String)?  onChange;

  const AppTextFormFields({super.key, this.labelText, this.keyBoardType, this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColor.p100,
      keyboardType: keyBoardType,
      onChanged: onChange, 
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.p100,
            ),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.redAccent,
            ),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: AppColor.p100,
            ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.redAccent,
            )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.gray50,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Color(0xFFC2C2C2),
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          height: 0.11,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColor.p100,
          ),
        ),
      ),
    );
  }
}
