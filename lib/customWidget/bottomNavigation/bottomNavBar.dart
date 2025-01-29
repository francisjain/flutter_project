import 'package:brocode_tutorial_1/customWidget/bottomNavigation/screen_search.dart';
import 'package:flutter/material.dart';

import 'screen_account.dart';
import 'screen_home.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentScreen = 1;

  final _pages = [
    Searchpage(),
    Homepage(),
    Accountpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreen,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blue,
        onTap: (value) => {
          setState(() {
            _currentScreen = value;
          })
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
