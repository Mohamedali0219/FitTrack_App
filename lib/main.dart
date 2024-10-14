import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fit_track_app/bloc_observer.dart';
import 'package:fit_track_app/fit_track.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(const FitTrackApp());
}
