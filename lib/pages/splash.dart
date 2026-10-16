import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../widgets/app_logo.dart';
import '../widgets/primary_button.dart';
import 'login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative background
            Positioned(
              top: -90,
              right: -100,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondary.withValues(alpha: 0.18),
                ),
              ),
            ),

            Positioned(
              bottom: 90,
              left: -100,
              child: Container(
                width: 210,
                height: 210,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accent.withValues(alpha: 0.20),
                ),
              ),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
              child: Column(
                children: [
                  const Spacer(flex: 3),

                  const AppLogo(size: 115),

                  const SizedBox(height: 28),

                  const Text(
                    'Daylie',
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -1.5,
                      color: AppColors.textPrimary,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Organize your day with ease',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const Spacer(flex: 4),

                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: screenSize.width > 600 ? 400 : 500,
                    ),
                    child: PrimaryButton(
                      text: 'Get Started',
                      icon: Icons.arrow_forward_rounded,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'Plan smarter. Live better.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
