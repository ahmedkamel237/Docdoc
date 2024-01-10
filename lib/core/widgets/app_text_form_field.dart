import 'package:doctor/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFields extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyBoardType;
  final void Function(String)? onChange;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? backgroundColor;
  final TextEditingController? controller;

  const AppTextFormFields(
      {super.key,
      this.labelText,
      this.keyBoardType,
      this.onChange,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.suffixIcon,
      this.obscureText,
      this.backgroundColor, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColor.p100,
      keyboardType: keyBoardType,
      onChanged: onChange,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 17.h,
            ),
        labelText: labelText,
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
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: AppColor.p100, width: 1.3),
            ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: AppColor.gray50,
              ),
            ),
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
        fillColor: backgroundColor ?? const Color(0xFFFDFDFF),
        filled: true,
      ),
    );
  }
}
