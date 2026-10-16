import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = 70});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.spa_rounded, size: size, color: AppColors.primary);
  }
}
