import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../widgets/primary_button.dart';
import 'login.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxHeight < 700;

            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 28, 28, 30),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 440),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Brand
                          const _BrandHeader(),

                          SizedBox(height: isCompact ? 42 : 65),

                          // Headline
                          const Text(
                            'Make every\n'
                            'day count.',
                            style: TextStyle(
                              fontSize: 46,
                              fontWeight: FontWeight.w800,
                              height: 1.08,
                              letterSpacing: -2,
                              color: AppColors.textPrimary,
                            ),
                          ),

                          const SizedBox(height: 18),

                          const Text(
                            'Your plans, tasks, and little wins.\n'
                            'All in one place.',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.6,
                              color: AppColors.textSecondary,
                            ),
                          ),

                          SizedBox(height: isCompact ? 25 : 42),

                          // Preview schedule
                          const _SchedulePreview(),

                          SizedBox(height: isCompact ? 35 : 65),

                          // Get Started
                          PrimaryButton(
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

                          const SizedBox(height: 20),

                          const Center(
                            child: Text(
                              'A better routine starts here.',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

// ==========================
// Brand Header
// ==========================

class _BrandHeader extends StatelessWidget {
  const _BrandHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(Icons.circle_outlined, size: 27, color: AppColors.primary),
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
    );
  }
}

// ==========================
// Schedule Preview
// ==========================

class _SchedulePreview extends StatelessWidget {
  const _SchedulePreview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.textPrimary.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Calendar header
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your week',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Icon(
                Icons.calendar_month_outlined,
                size: 20,
                color: AppColors.primary,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Date preview
          const Row(
            children: [
              Expanded(
                child: _DateItem(day: 'MON', date: '19'),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _DateItem(day: 'TUE', date: '20', selected: true),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _DateItem(day: 'WED', date: '21'),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _DateItem(day: 'THU', date: '22'),
              ),
              SizedBox(width: 6),
              Expanded(
                child: _DateItem(day: 'FRI', date: '23'),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // One upcoming activity
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  size: 20,
                  color: AppColors.primary,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Morning planning',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                Text(
                  '09:00',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// Date Item
// ==========================

class _DateItem extends StatelessWidget {
  final String day;
  final String date;
  final bool selected;

  const _DateItem({
    required this.day,
    required this.date,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: selected ? AppColors.accent : AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            date,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================
// Event Card
// ==========================

class _EventCard extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final Color color;
  final IconData icon;

  const _EventCard({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            time,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
