import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _showPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Login validation
  void _handleLogin() {
    if (!_formKey.currentState!.validate()) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login form berhasil divalidasi')),
    );
  }

  // Social login placeholder
  void _socialLogin(String provider) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$provider login belum tersedia')));
  }

  void _forgotPassword() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset belum tersedia')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 28),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 440,
                    minHeight: constraints.maxHeight - 56,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // =========================
                      // App Brand
                      // =========================
                      const Row(
                        children: [
                          Icon(
                            Icons.circle_outlined,
                            size: 27,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'daylie.',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -1.2,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 58),

                      // =========================
                      // Header - Left Aligned
                      // =========================
                      const Text(
                        'Welcome\nback.',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w800,
                          height: 1.1,
                          letterSpacing: -1.8,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Your day looks better when\n'
                        'everything is in place.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.6,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 38),

                      // =========================
                      // Login Form
                      // =========================
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Email
                            CustomTextField(
                              label: 'Email address',
                              hint: 'Enter your email',
                              icon: Icons.mail_outline_rounded,
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                final email = value?.trim() ?? '';

                                if (email.isEmpty) {
                                  return 'Email is required';
                                }

                                final emailPattern = RegExp(
                                  r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                                );

                                if (!emailPattern.hasMatch(email)) {
                                  return 'Enter a valid email address';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 22),

                            // Password
                            CustomTextField(
                              label: 'Password',
                              hint: 'Enter your password',
                              icon: Icons.lock_outline_rounded,
                              controller: _passwordController,
                              obscureText: !_showPassword,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                icon: Icon(
                                  _showPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is required';
                                }

                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }

                                return null;
                              },
                            ),

                            const SizedBox(height: 12),

                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: _forgotPassword,
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Login Button
                            PrimaryButton(
                              text: 'Log In',
                              icon: Icons.arrow_forward_rounded,
                              onPressed: _handleLogin,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // =========================
                      // Social Login
                      // =========================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _SocialIcon(
                            label: 'Google',
                            onTap: () => _socialLogin('Google'),
                            child: const Text(
                              'G',
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF4285F4),
                              ),
                            ),
                          ),

                          const SizedBox(width: 22),

                          _SocialIcon(
                            label: 'Apple',
                            onTap: () => _socialLogin('Apple'),
                            child: const Icon(
                              Icons.apple,
                              size: 27,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 36),

                      // =========================
                      // Register Navigation
                      // =========================
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textSecondary,
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// =========================
// Social Icon Button
// =========================

class _SocialIcon extends StatelessWidget {
  final String label;
  final Widget child;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.label,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      child: Material(
        color: AppColors.white,
        shape: const CircleBorder(side: BorderSide(color: AppColors.border)),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: SizedBox(width: 54, height: 54, child: Center(child: child)),
        ),
      ),
    );
  }
}
