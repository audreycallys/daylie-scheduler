import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'pages/splash.dart';

void main() {
  runApp(const DaylieApp());
}

class DaylieApp extends StatelessWidget {
  const DaylieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daylie',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
