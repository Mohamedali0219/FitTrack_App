import 'package:bloc/bloc.dart';
import 'package:fit_track_app/bloc_observer.dart';
import 'package:fit_track_app/fit_track.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const FitTrackApp());
}
