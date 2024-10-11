import 'package:fit_track_app/core/constants.dart';
import 'package:fit_track_app/features/drawer/data/menu_model.dart';
import 'package:fit_track_app/features/drawer/ui/drawer_widget.dart';
import 'package:fit_track_app/features/home/ui/home_screen.dart';
import 'package:fit_track_app/features/meals/ui/meals_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _drawerController = ZoomDrawerController();

  MenuItem currentItem = MenuItems.dashboard;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
    controller: _drawerController,
    style: DrawerStyle.defaultStyle,
    borderRadius: 40,
    angle: 0,
    menuBackgroundColor: Colors.white,
    showShadow: true,
    drawerShadowsBackgroundColor: const Color(0xFFB0C929),
    slideWidth: MediaQuery.of(context).size.width * 0.7,
    slideHeight: MediaQuery.of(context).size.height * 0.01,
    menuScreen: Builder(
      builder: (context) {
        return DrawerWidget(
          currentItem: currentItem,
          onSelectedItem: (item){
            setState(() {
              currentItem = item;
            });
            ZoomDrawer.of(context)!.close();
          },
        );
      }
    ),
    mainScreen: getScreen(),
  );

  Widget getScreen() {
    switch(currentItem){
      case MenuItems.dashboard:
        return const HomeScreen();
      case MenuItems.myProgress:
        return const HomeScreen();
      case MenuItems.training:
        return const MealsScreen();
      case MenuItems.categories:
        return const MealsScreen();
      case MenuItems.notification:
        return const MealsScreen();
      case MenuItems.myFavorites:
        return const MealsScreen();
      case MenuItems.appSettings:
        return const MealsScreen();
      case MenuItems.contactSupport:
        return const MealsScreen();
      default:
        return _errorRoute();
    }
  }

  Widget _errorRoute() {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      );
  }
}