import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:doctor/core/widgets/app_buttons.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey _key = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36.h),
            AppTextFormFields(
              labelText: "Email",
              controller: _emailController,
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            PasswordTextForm(
              controller: _passwordController,
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

class PasswordTextForm extends StatefulWidget {
  final TextEditingController controller;

  const PasswordTextForm({super.key, required this.controller});

  @override
  State<PasswordTextForm> createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return AppTextFormFields(
      labelText: "Password",
      obscureText: isSecure,
      controller: widget.controller,
      suffixIcon: GestureDetector(
        onTap: () {
          setState(
            () {
              isSecure = !isSecure;
            },
          );
        },
        child: Icon(
          isSecure ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );
  }
}
