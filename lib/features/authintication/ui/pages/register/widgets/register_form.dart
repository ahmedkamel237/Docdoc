import 'package:doctor/core/helpers/app_regx.dart';
import 'package:doctor/core/widgets/app_buttons.dart';
import 'package:doctor/core/widgets/app_text_form_field.dart';
import 'package:doctor/features/authintication/data/models/api_register_input.dart';
import 'package:doctor/features/authintication/ui/pages/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  late TextEditingController _passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isSecure = true;
  bool isSecure2 = true;

  @override
  void initState() {
    super.initState();
    _passwordController = context.read<RegisterCubit>().passwordController;
    setupPasswordControllerListeners();
  }

  void setupPasswordControllerListeners() {
    _passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(_passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(_passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(_passwordController.text);
        hasNumber = AppRegex.hasNumber(_passwordController.text);
        hasMinLength = AppRegex.hasMinLength(_passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 36.h),
          AppTextFormFields(
            labelText: "Name",
            controller: context.read<RegisterCubit>().name,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 2) {
                return "name must not be empty or less than 2 characters";
              }
            },
          ),
          SizedBox(height: 16.h),
          AppTextFormFields(
            controller: context.read<RegisterCubit>().emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "please enter a valid email";
              }
            },
            labelText: "Email",
          ),
          SizedBox(height: 16.h),
          AppTextFormFields(
            controller: context.read<RegisterCubit>().passwordController,
            obscureText: isSecure,
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
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter a valid password.";
              }
            },
            labelText: "Password",
          ),
          SizedBox(height: 16.h),
          AppTextFormFields(
            controller:
                context.read<RegisterCubit>().passwordConfirmationController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "please enter a valid password.";
              }
              if (context
                      .read<RegisterCubit>()
                      .passwordConfirmationController.text !=
                  context.read<RegisterCubit>().passwordController.text) {
                return "You Password is Not Equal Confirm Password.";
              }
            },
            obscureText: isSecure2,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(
                  () {
                    isSecure2 = !isSecure2;
                  },
                );
              },
              child: Icon(
                isSecure2 ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            labelText: "Confirm Password",
          ),
          SizedBox(height: 16.h),
          AppTextFormFields(
            controller: context.read<RegisterCubit>().phone,
            validator: (value) {},
            labelText: "Phone",
          ),
          SizedBox(height: 16.h),
          AppTextFormFields(
            controller: context.read<RegisterCubit>().gender,
            validator: (value) {},
            labelText: "Gender",
          ),
          SizedBox(height: 32.h),
          AppButtons.primary(
            title: "Create account",
            onTap: () {
              validateThenDoRegister();
            },
          ),
        ],
      ),
    );
  }

  void validateThenDoRegister() {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitLoginStates(ApiRegisterInput(
          name: context.read<RegisterCubit>().name.text,
          gender: context.read<RegisterCubit>().gender.text,
          password_confirmation:
              context.read<RegisterCubit>().passwordConfirmationController.text,
          phone: context.read<RegisterCubit>().phone.text,
          email: context.read<RegisterCubit>().emailController.text,
          password: context.read<RegisterCubit>().passwordController.text));
    }
  }
}
