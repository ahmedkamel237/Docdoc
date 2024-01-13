import 'package:doctor/core/di/dependany_injection.dart';
import 'package:doctor/core/helpers/extentions.dart';
import 'package:doctor/core/routing/routs.dart';
import 'package:doctor/core/theme/app_text_style.dart';
import 'package:doctor/core/theme/color.dart';
import 'package:doctor/features/authintication/ui/pages/register/register_cubit.dart';
import 'package:doctor/features/authintication/ui/pages/register/register_state.dart';
import 'package:doctor/features/authintication/ui/pages/register/widgets/register_form.dart';
import 'package:doctor/features/authintication/ui/widgets/already_have_account.dart';
import 'package:doctor/features/authintication/ui/widgets/terms_conditions.dart';
import 'package:doctor/features/authintication/ui/widgets/title_subtitle_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: const _RegisterScreenBody(),
    );
  }
}

class _RegisterScreenBody extends StatelessWidget {
  const _RegisterScreenBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
      current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => Center(
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
              builder: (context) => AlertDialog(
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
                      child: Text(
                        "Got it",
                        style: AppTextStyle.font14BlueSemiBold,
                      )),
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
                    const TitleAndSubTitleHeader(
                      title: "Create Account",
                      subtitle:
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                    ),
                    const RegisterForm(),
                    SizedBox(height: 16.h),
                    const TermsAndConditions(),
                    SizedBox(height: 20.h),
                    Center(
                      child: AlreadyHaveAccount(
                        title: "Already have an account yet?",
                        buttonTitle: "Sign in",
                        buttonTab: () {
                          context.pushReplacementNamed(Routes.loginScreen);
                        },
                      ),
                    ),
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
