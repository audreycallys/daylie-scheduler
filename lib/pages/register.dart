import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: const Text('Register'),
      ),
      body: const Center(child: Text('Daylie - Register Page')),
    );
  }
}
