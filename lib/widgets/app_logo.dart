import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double iconSize;
  final double fontSize;

  const AppLogo({super.key, this.iconSize = 27, this.fontSize = 25});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle_outlined, size: iconSize, color: AppColors.primary),
        const SizedBox(width: 10),
        Text(
          'daylie.',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.2,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
