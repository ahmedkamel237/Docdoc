import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:doctor/core/widgets/app_buttons.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36.h),
            const AppTextFormFields(
              labelText: "Email",
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            const AppTextFormFields(
              labelText: "Password",
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Checkbox(
                  value: true,
                  activeColor: AppColor.p100,
                  onChanged: (value) {},
                ),
                Text(
                  "Remember me",
                  style: AppTextStyle.font13grayRegular,
                ),
                const Spacer(),
                Text(
                  "Forgot Password?",
                  style: AppTextStyle.font24blueBold
                      .copyWith(fontWeight: FontWeight.normal, fontSize: 12.sp),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            AppButtons.primary(
              title: "Login",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
