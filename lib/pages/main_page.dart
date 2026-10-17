import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../widgets/bottom_bar.dart';

import 'home.dart';
import 'schedule.dart';
import 'notification.dart';
import 'profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    SchedulePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  void _changeTab(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentIndex,
        onTap: _changeTab,
      ),
    );
  }
}
