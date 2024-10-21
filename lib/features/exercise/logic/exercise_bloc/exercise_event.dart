// exercise_event.dart
import 'package:equatable/equatable.dart';

abstract class ExerciseEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchExercises extends ExerciseEvent {}