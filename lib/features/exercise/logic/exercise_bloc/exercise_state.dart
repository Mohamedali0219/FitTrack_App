// Exercise_state.dart
import 'package:equatable/equatable.dart';

class ExerciseState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final List<Map<String, dynamic>> exercises;

  ExerciseLoaded(this.exercises);

  @override
  List<Object?> get props => [exercises];
}

class ExerciseError extends ExerciseState {
  final String message;

  ExerciseError(this.message);

  @override
  List<Object?> get props => [message];
}
