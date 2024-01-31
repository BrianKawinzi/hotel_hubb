import 'package:flutter/material.dart';
import 'package:hotel_hubb/pages/general.dart';
import 'package:hotel_hubb/pages/home_page.dart';
import 'package:hotel_hubb/pages/pos.dart';
import 'package:hotel_hubb/pages/profile.dart';
import 'package:hotel_hubb/pages/report.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigstionState();
}

class _BottomNavigstionState extends State<BottomNavigation> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const HomePage(),
    const POS(),
    const General(),
    const Report(),
    const Profile(),
  ];

  //page controller
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 248, 204, 72),
        unselectedItemColor: const Color.fromARGB(255, 255, 153, 0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: _currentIndex == 0 ? Colors.orange : const Color.fromARGB(240, 252, 172, 59)),
            label: 'Board'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.point_of_sale, color: _currentIndex == 0 ? Colors.orange : const Color.fromARGB(240, 252, 172, 59)),
            label: 'POS'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps, color: _currentIndex == 0 ? Colors.orange : const Color.fromARGB(240, 252, 172, 59)),
            label: 'General'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart, color: _currentIndex == 0 ? Colors.orange : const Color.fromARGB(240, 252, 172, 59)),
            label: 'Reports'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: _currentIndex == 0 ? Colors.orange : const Color.fromARGB(240, 252, 172, 59)),
            label: 'Profile'
          ),
        ],
      ),
    );
  }
}