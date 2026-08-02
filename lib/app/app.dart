import 'package:flutter/material.dart';
import 'router/app_router.dart';
import './theme/app_theme.dart';

class DangDangApp extends StatelessWidget {
  const DangDangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.light,
    );
  }
}
