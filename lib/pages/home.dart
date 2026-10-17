import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../widgets/app_logo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reusable App Logo
            AppLogo(),

            SizedBox(height: 45),

            // Heading
            Text(
              'Make today\nyours.',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w800,
                height: 1.1,
                color: AppColors.textPrimary,
              ),
            ),

            SizedBox(height: 12),

            // Subtitle
            Text(
              'A little progress every day adds up.',
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
