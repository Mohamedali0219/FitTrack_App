import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_track_app/core/constants.dart';
import 'package:fit_track_app/features/app_settings/ui/app_settings_screen.dart';
import 'package:fit_track_app/features/auth/data/model/user.dart';
import 'package:fit_track_app/features/drawer/data/menu_model.dart';
import 'package:fit_track_app/features/drawer/ui/drawer_widget.dart';
import 'package:fit_track_app/features/home/ui/home_screen.dart';
import 'package:fit_track_app/features/meals/ui/meals_screen.dart';
import 'package:fit_track_app/features/profile/profile_screen.dart';
import 'package:fit_track_app/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _drawerController = ZoomDrawerController();
  bool loading = false;

  MenuItem currentItem = MenuItems.home;

  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  void loadUserData() async {
    String? user = SharedPreference().getString(key: "user");
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user)
        .get()
        .then((res) {
      UserModel.instance.fromFirestore(res.data() as Map<String, dynamic>);
      setState(() {
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) => !loading
      ? const Center(
          child: CircularProgressIndicator(),
        )
      : ZoomDrawer(
          controller: _drawerController,
          style: DrawerStyle.defaultStyle,
          borderRadius: 40,
          angle: 0,
          menuBackgroundColor: Colors.white,
          showShadow: true,
          drawerShadowsBackgroundColor: const Color(0xFFB0C929),
          slideWidth: MediaQuery.of(context).size.width * 0.7,
          slideHeight: MediaQuery.of(context).size.height * 0.01,
          menuScreen: Builder(builder: (context) {
            return DrawerWidget(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() {
                  currentItem = item;
                });
                ZoomDrawer.of(context)!.close();
              },
            );
          }),
          mainScreen: getScreen(),
        );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.home:
        return const HomeScreen();
      case MenuItems.profile:
        return const ProfileScreen();
      case MenuItems.myFavorites:
        return const MealsScreen();
      case MenuItems.appSettings:
        return const AppSettingsScreen();
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
