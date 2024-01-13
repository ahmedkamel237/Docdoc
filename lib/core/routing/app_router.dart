import 'package:doctor/core/routing/routs.dart';
import 'package:doctor/features/authintication/ui/pages/login/login_screen.dart';
import 'package:doctor/features/authintication/ui/pages/register/register_page.dart';
import 'package:doctor/features/home/home_screen.dart';
import 'package:doctor/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be used any screen like this
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
        case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
        case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
