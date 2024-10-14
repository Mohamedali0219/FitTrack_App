import 'package:fit_track_app/features/drawer/data/menu_model.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = 'https://dummyjson.com/';
}

class MenuItems {
  static const home = MenuItem('Home', Icons.home);
  static const myFavorites = MenuItem('My Favorites', Icons.favorite_outline);
  static const profile = MenuItem('Profile', Icons.person_2_outlined);
  static const appSettings = MenuItem('App Settings', Icons.settings);
  static const contactSupport = MenuItem('Contact Support', Icons.settings);

  static const all = <MenuItem>[
    home,
    myFavorites,
    profile,
    appSettings,
    contactSupport,
  ];
}