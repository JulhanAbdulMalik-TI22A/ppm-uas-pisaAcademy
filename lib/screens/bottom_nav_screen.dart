import 'package:flutter/material.dart';
import 'package:pisa_academy/screens/home.dart';
import 'package:pisa_academy/screens/lesson/lessons_list.dart';
import 'package:pisa_academy/screens/profile.dart';
import 'package:pisa_academy/screens/student/student_list.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Home(),
    const LessonsList(),
    const StudentsList(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded, color: Colors.blue),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_lesson_outlined),
            activeIcon: Icon(Icons.play_lesson_rounded, color: Colors.blue),
            label: 'Lessons',
            tooltip: 'Lessons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1_outlined),
            activeIcon:
                Icon(Icons.person_add_alt_1_rounded, color: Colors.blue),
            label: 'Students',
            tooltip: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person, color: Colors.blue),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
