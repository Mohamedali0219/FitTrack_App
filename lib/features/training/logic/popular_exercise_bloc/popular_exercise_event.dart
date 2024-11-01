// exercise_event.dart
import 'package:equatable/equatable.dart';

abstract class PopularExerciseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchPopularExercises extends PopularExerciseEvent {}