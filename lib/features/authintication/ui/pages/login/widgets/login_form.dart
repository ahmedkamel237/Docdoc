import 'package:doctor/core/helpers/app_regx.dart';
import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:doctor/core/widgets/app_buttons.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:doctor/features/authintication/data/models/api_login_input.dart';
import 'package:doctor/features/authintication/ui/pages/login/login_cubit.dart';
import 'package:doctor/features/authintication/ui/pages/login/widgets/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  @override
  void initState() {
    super.initState();
    _passwordController = context
        .read<LoginCubit>()
        .passwordController;
    setupPasswordControllerListeners();
  }

  void setupPasswordControllerListeners() {
    _passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(_passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(_passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(_passwordController.text);
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context
          .read<LoginCubit>()
          .formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36.h),
            AppTextFormFields(
              labelText: "Email",
              controller: context
                  .read<LoginCubit>()
                  .emailController,
              validator: (value) {
                if (value == null || value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return "please enter a valid email";
                }
              },
              keyBoardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            PasswordTextForm(
              controller: context
                  .read<LoginCubit>()
                  .passwordController,
            ),
            SizedBox(height: 24.h),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            ),
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
              onTap: () {
                validateThenDoLogin();
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin() {
    if (context
        .read<LoginCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<LoginCubit>().emitLoginStates(ApiLoginInput(
          email: context
              .read<LoginCubit>()
              .emailController
              .text,
          password: context
              .read<LoginCubit>()
              .passwordController
              .text));
    }
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "please enter a valid password.";
        }
      },
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
