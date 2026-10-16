import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double size;

  const AppLogo({super.key, this.size = 110});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.secondary.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Icon(
        Icons.spa_rounded,
        size: size * 0.55,
        color: AppColors.primary,
      ),
    );
  }
}
