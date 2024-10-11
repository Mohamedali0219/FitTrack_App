import 'package:fit_track_app/core/helper/Extension/functions.dart';
import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:fit_track_app/features/home/ui/home_screen.dart';
import 'package:fit_track_app/features/meals/ui/meals_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPage = 0;

  final screens = [
    const HomeScreen(),
    const MealsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        elevation: 0.0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: setPhoto(kind: 1, path: 'assets/icons/icon_home.svg', height: 20, width: 20),
            activeIcon: setPhoto(kind: 1, path: 'assets/icons/icon_home_bold.svg', height: 20, width: 20),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: setPhoto(kind: 1, path: 'assets/icons/Diet.svg', height: 20, width: 20),
            activeIcon: setPhoto(kind: 1, path: 'assets/icons/Diet_bold.svg', height: 20, width: 20),
            label: 'Meal Plans',
          ),
          BottomNavigationBarItem(
            icon: setPhoto(kind: 1, path: 'assets/icons/Exercise.svg', height: 20, width: 20),
            activeIcon: setPhoto(kind: 1, path: 'assets/icons/Exercise_bold.svg', height: 20, width: 20),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: setPhoto(kind: 1, path: 'assets/icons/icon_profile.svg', height: 20, width: 20),
            activeIcon: setPhoto(kind: 1, path: 'assets/icons/icon_profile_bold.svg', height: 20, width: 20),
            label: 'Profile',
          ),
        ],
        selectedItemColor:  ColorsManager.blackColor,
        unselectedItemColor: const Color(0xFF9DA3A8),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          color: ColorsManager.blackColor,
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF9DA3A8),
          fontSize: 12,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
