import 'package:doctor/core/di/dependany_injection.dart';
import 'package:doctor/core/routing/app_router.dart';
import 'package:doctor/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  setUpGetIt();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}
