import 'package:agriculture_app/constant/image_constant.dart';
import 'package:agriculture_app/feature/help_page/help_screen.dart';
import 'package:agriculture_app/feature/home_page/view/home_screen.dart';
import 'package:agriculture_app/feature/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    HelpScreen(),
    NotificationScreen(),
    HelpScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6A7C6F).withOpacity(0.7),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.notification),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(ImageConstant.help),
            label: '',
          ),
        ],
      ),
    );
  }
}
