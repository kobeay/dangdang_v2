import 'package:flutter/material.dart';
import '../app/router/app.router.dart';

class DangDangApp extends StatelessWidget {
  const DangDangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
