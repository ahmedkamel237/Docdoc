import 'package:doctor/core/di/dependany_injection.dart';
import 'package:doctor/core/helpers/extentions.dart';
import 'package:doctor/core/routing/routs.dart';
import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:doctor/features/authintication/ui/login/login_cubit.dart';
import 'package:doctor/features/authintication/ui/login/login_state.dart';
import 'package:doctor/features/authintication/ui/login/widgets/already_have_account.dart';
import 'package:doctor/features/authintication/ui/login/widgets/login_form.dart';
import 'package:doctor/features/authintication/ui/login/widgets/terms_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: const _LoginScreenBody(),
    );
  }
}

class _LoginScreenBody extends StatefulWidget {
  const _LoginScreenBody();

  @override
  State<_LoginScreenBody> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) =>
                  Center(
                    child: CircularProgressIndicator(
                      color: AppColor.p100,
                    ),
                  ),
            );
          },
          success: (data) {
            context.pop();
            context.pushReplacementNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            showDialog(
              context: context,
              builder: (context) =>
                  AlertDialog(
                    icon: const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    ),
                    content: Text(
                      error,
                      style: AppTextStyle.font15DarkBlueMedium,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: Text("Got it",
                              style: AppTextStyle.font14BlueSemiBold,)),
                    ],
                  ),
            );
          },
        );
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50.h),
                    Text(
                      "Welcome Back",
                      style: AppTextStyle.font24blueBold,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                      style: AppTextStyle.font13grayRegular.copyWith(
                        height: 1.8,
                        fontSize: 14,
                        letterSpacing: 0.20,
                      ),
                    ),
                    const LoginForm(),
                    SizedBox(height: 16.h),
                    const TermsAndConditions(),
                    SizedBox(height: 40.h),
                    const Center(child: AlreadyHaveAccount()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
