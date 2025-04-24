import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_track_app/bloc_observer.dart';
import 'package:fit_track_app/core/helper/database/database_helper.dart';
import 'package:fit_track_app/core/service/reminder/notification_helper.dart';
import 'package:fit_track_app/fit_track.dart';
import 'package:fit_track_app/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/functions.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.initDb();
  await NotificationHelper.initializeNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreference.initialize();
  Bloc.observer = MyBlocObserver();

  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(), child: const FitTrackApp()));
}
