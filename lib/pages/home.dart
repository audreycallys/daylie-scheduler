import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../widgets/app_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();

  final List<_Activity> _activities = [
    _Activity(
      title: 'Morning planning',
      description: 'Start with your priorities',
      time: '09:00',
      icon: Icons.edit_calendar_outlined,
      color: AppColors.primarySoft,
      isCompleted: true,
    ),
    _Activity(
      title: 'Focus session',
      description: 'Time to get things done',
      time: '11:30',
      icon: Icons.lightbulb_outline_rounded,
      color: Color(0xFFFFF5D2),
    ),
    _Activity(
      title: 'Design review',
      description: 'Review your progress',
      time: '15:00',
      icon: Icons.check_circle_outline_rounded,
      color: Color(0xFFF2F2F5),
    ),
  ];

  bool _sameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  String _formatDate(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];

    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${days[date.weekday - 1]}, '
        '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatMonth(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return '${months[date.month - 1]} ${date.year}';
  }

  void _toggleActivity(int index) {
    setState(() {
      _activities[index].isCompleted = !_activities[index].isCompleted;
    });
  }

  void _addActivity() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add Activity belum tersedia')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isToday = _sameDay(_selectedDate, now);

    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(26, 28, 26, 32),
            children: [
              // =========================
              // App Logo
              // =========================
              const AppLogo(),

              const SizedBox(height: 32),

              // =========================
              // Date & Heading
              // =========================
              Text(
                _formatDate(now),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 13),

              const Text(
                'Make today\nyours.',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  height: 1.08,
                  letterSpacing: -1.6,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'A little progress every day adds up.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 28),

              // =========================
              // Overview Banner
              // =========================
              _OverviewBanner(totalActivities: _activities.length),

              const SizedBox(height: 33),

              // =========================
              // Weekly Calendar Header
              // =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Your week',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    _formatMonth(now),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // =========================
              // Weekly Calendar
              // =========================
              _WeekCalendar(
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),

              const SizedBox(height: 32),

              // =========================
              // Agenda Header
              // =========================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isToday ? "Today's agenda" : 'Your agenda',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          isToday
                              ? '${_activities.length} activities planned'
                              : _formatDate(_selectedDate),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  IconButton(
                    onPressed: _addActivity,
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primarySoft,
                      foregroundColor: AppColors.primary,
                    ),
                    icon: const Icon(Icons.add_rounded, size: 23),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // =========================
              // Agenda Cards
              // =========================
              if (isToday)
                ...List.generate(_activities.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ActivityCard(
                      activity: _activities[index],
                      onToggle: () => _toggleActivity(index),
                    ),
                  );
                })
              else
                const _EmptyAgenda(),

              const SizedBox(height: 16),

              const Center(
                child: Text(
                  'Small steps. Better days.',
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
    );
  }
}

// =====================================
// Dummy Activity Model
// =====================================

class _Activity {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color color;
  bool isCompleted;

  _Activity({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.color,
    this.isCompleted = false,
  });
}

// =====================================
// Overview Banner
// =====================================

class _OverviewBanner extends StatelessWidget {
  final int totalActivities;

  const _OverviewBanner({required this.totalActivities});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(23),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TODAY AT A GLANCE',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                    color: Color(0xFFE0DDFB),
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  '$totalActivities activities',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: AppColors.white,
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Your day is taking shape.',
                  style: TextStyle(fontSize: 12, color: Color(0xFFE0DDFB)),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          Container(
            width: 58,
            height: 58,
            decoration: const BoxDecoration(
              color: AppColors.accent,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.wb_sunny_outlined,
              size: 28,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================
// Weekly Calendar
// =====================================

class _WeekCalendar extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const _WeekCalendar({
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final monday = DateTime(
      now.year,
      now.month,
      now.day,
    ).subtract(Duration(days: now.weekday - 1));

    const days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

    return Row(
      children: List.generate(7, (index) {
        final date = monday.add(Duration(days: index));

        final isSelected =
            date.year == selectedDate.year &&
            date.month == selectedDate.month &&
            date.day == selectedDate.day;

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () => onDateSelected(date),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.accent : AppColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        days[index],
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),

                    const SizedBox(height: 9),

                    Text(
                      '${date.day}',
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// =====================================
// Activity Card
// =====================================

class _ActivityCard extends StatelessWidget {
  final _Activity activity;
  final VoidCallback onToggle;

  const _ActivityCard({required this.activity, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: activity.color,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(activity.icon, size: 22, color: AppColors.primary),
          ),

          const SizedBox(width: 13),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: activity.isCompleted
                        ? AppColors.textSecondary
                        : AppColors.textPrimary,
                    decoration: activity.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  activity.description,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  activity.time,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              activity.isCompleted
                  ? Icons.check_circle_rounded
                  : Icons.radio_button_unchecked_rounded,
              size: 25,
              color: activity.isCompleted
                  ? AppColors.primary
                  : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================
// Empty Agenda
// =====================================

class _EmptyAgenda extends StatelessWidget {
  const _EmptyAgenda();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: AppColors.border),
      ),
      child: const Column(
        children: [
          Icon(
            Icons.event_available_outlined,
            size: 35,
            color: AppColors.primary,
          ),

          SizedBox(height: 12),

          Text(
            'Nothing planned yet',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),

          SizedBox(height: 7),

          Text(
            'A fresh day for new plans.',
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
