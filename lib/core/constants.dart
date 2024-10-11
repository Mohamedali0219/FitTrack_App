import 'package:fit_track_app/features/drawer/data/menu_model.dart';
import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = 'https://dummyjson.com/';
}

class MenuItems {
  static const dashboard = MenuItem('Dashboard', Icons.dashboard);
  static const myProgress = MenuItem('My Progress', Icons.power);
  static const training = MenuItem('Training', Icons.model_training);
  static const categories = MenuItem('Categories', Icons.category_outlined);
  static const notification = MenuItem('Notification', Icons.notifications_none_outlined);
  static const myFavorites = MenuItem('My Favorites', Icons.favorite_outline);
  static const appSettings = MenuItem('App Settings', Icons.settings);
  static const contactSupport = MenuItem('Contact Support', Icons.settings);

  static const all = <MenuItem>[
    dashboard,
    myProgress,
    training,
    categories,
    notification,
    myFavorites,
    appSettings,
    contactSupport,
  ];
}