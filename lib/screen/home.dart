import 'package:flutter/material.dart';
import 'package:solution_challenge_front/constant/app_color.dart';
import 'package:solution_challenge_front/screen/settings_screen.dart';

import 'home_screen.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // 현재 선택된 인덱스
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: IndexedStack(
        index: _selectedIndex,
        children:  [
          HomeScreen(),
          const SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // 현재 선택된 인덱스를 지정합니다.
        selectedItemColor: AppColor.primaryColor, // 선택된 아이템의 색상을 설정합니다.
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템의 색상을 설정할 수도 있습니다.
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // 이 레이블은 실제로 표시되지 않을 것입니다.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings', // 이 레이블도 실제로 표시되지 않을 것입니다.
          ),
        ],

        // 현재 선택된 인덱스와 onTap 콜백을 설정해야 할 수 있습니다.
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}